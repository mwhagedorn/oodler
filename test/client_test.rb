require 'test_helper'
require 'test_helper'

class ClientTest < Test::Unit::TestCase
  context "when hitting the Oodle API" do
    setup do
      @oodler = Oodler::Client.new('key')
    end
    should "have a web client" do
      stub_get("/listings?region=chicago&category=vehicle%2fcar&key=key", "listings.xml")
      wc = mock('webclient')

      Oodler::WebClient.expects(:new).with('keyval').returns(wc)
      @oodler = Oodler::Client.new('keyval')

      @oodler.web_client.should == wc

    end

   context "and a region is not provided" do
      should "throw an error" do
        stub_get("/v2/listings?region=chicago&category=vehicle%2Fcar&key=key", "listings.xml")
        assert_raise(Oodler::OodleArgumentError)  do
          @oodler.search(nil, {:category=>"vehicle/car"})
        end

      end
   end

    should "retrieve a listing" do
     stub_get("/api/v2/listings?key=key&region=chicago&category=vehicle%2Fcars", "listings.xml")
     p = @oodler.search("chicago", {:category => "vehicle/cars"})

     p.region.id.should == "chicago"
     p.region.name.should == "Chicago"
     p.category.id.should == "vehicle/car"
     p.start.should == "1"
     p.listings.size.should == 10
     p.listings[0].id.should == "1899168373"
     p.listings[0].title.should == "2002 Mazda Tribute"
     p.listings[0].category.name.should == "SUVs"
     p.listings[0].source.name.should == "EveryCarListed.com"
     p.listings[0].location.zip.should == "60453"
     p.listings[0].images.size.should == 2
     p.listings[0].images[0].src.should == "http://i.oodleimg.com/item/1899168373_1m?1271098477"
     p.listings[0].paid?.should == true
     p.listings[0].properties.should_not == nil
     p.listings[0].properties["color"].should == "Grey"
    end

     should "retrieve a listing using convenience  method" do
       stub_get("/api/v2/listings?key=key&region=chicago&category=vehicle%2Fcars", "listings.xml")
       p = @oodler.search_by_category("chicago", "vehicle/cars")

       p.region.id.should == "chicago"
       p.region.name.should == "Chicago"
       p.category.id.should == "vehicle/car"
       p.start.should == "1"
       p.listings.size.should == 10
       p.listings[0].id.should == "1899168373"
       p.listings[0].title.should == "2002 Mazda Tribute"
       p.listings[0].category.name.should == "SUVs"
       p.listings[0].source.name.should == "EveryCarListed.com"
       p.listings[0].location.zip.should == "60453"
       p.listings[0].images.size.should == 2
       p.listings[0].images[0].src.should == "http://i.oodleimg.com/item/1899168373_1m?1271098477"
       p.listings[0].paid?.should == true
       p.listings[0].properties.should_not == nil
       p.listings[0].properties["color"].should == "Grey"
     end
    context "when using the listing method " do
      should "retrieve a listing " do
        stub_get("/api/v2/listings?key=key&region=chicago&category=vehicle%2Fcars", "listings.xml")
        p = @oodler.listing({:region =>"chicago", :category=>"vehicle/cars"})

        p.region.id.should == "chicago"
        p.region.name.should == "Chicago"
        p.category.id.should == "vehicle/car"
        p.start.should == "1"
        p.listings.size.should == 10
        p.listings[0].id.should == "1899168373"
        p.listings[0].title.should == "2002 Mazda Tribute"
        p.listings[0].category.name.should == "SUVs"
        p.listings[0].source.name.should == "EveryCarListed.com"
        p.listings[0].location.zip.should == "60453"
        p.listings[0].images.size.should == 2
        p.listings[0].images[0].src.should == "http://i.oodleimg.com/item/1899168373_1m?1271098477"
        p.listings[0].paid?.should == true
        p.listings[0].properties.should_not == nil
        p.listings[0].properties["color"].should == "Grey"
      end

      should "throw an error with empty hash" do
        stub_get("/api/v2/listings?key=key&region=chicago&category=vehicle%2Fcars", "listings.xml")
        assert_raise(Oodler::OodleArgumentError)  do
          @oodler.listing()
        end


      end

      should "allow inclusion of attributes in the query" do
         stub_get("/api/v2/listings?region=chicago&attributes=make_honda%2Cmodel_civic%2Cprice_12000_15000&key=key&category=vehicle%2Fcars", "listings.xml")

        @oodler.listing({:region =>"chicago", :category=>"vehicle/cars", :attributes=>"make_honda,model_civic,price_12000_15000"})

      end

      should "display error details" do
        stub_get("/api/v2/listings?region=chicago&attributes=make_honda%2Cmodel_civic%2Cprice_12000_15000&key=key&category=vehicle%2Fbogus", "fail.xml")
        assert_raise(Oodler::OodlerError) do
          @oodler.listing({:region =>"chicago", :category=>"vehicle/bogus", :attributes=>"make_honda,model_civic,price_12000_15000"})
        end

      end
      
    end


    should "encode spaces as %20" do
     stub_get("/api/v2/listings?key=key&region=sf&category=job&q=software%20engineer", "listings.xml")
     p = @oodler.search("sf", {:category => "job", :q =>"software engineer"})

    end

    should "encode commas as %2C" do
     stub_get("/api/v2/listings?location=San%20Mateo%2C%20CA&region=usa&key=key&category=job&", "listings.xml")
     p = @oodler.search("usa", {:category => "job", :location =>"San Mateo, CA"})

    end




  end
  
end