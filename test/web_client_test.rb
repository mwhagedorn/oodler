require 'test_helper'

class WebClientTest < Test::Unit::TestCase
  context "when hitting the Oodle API" do
    setup do
      @wc = Oodler::WebClient.new('key')
    end

  should "throw an error if key is nil" do
     @wc = Oodler::WebClient.new
      stub_get("/api/v2/listings?region=chicago&category=vehicle%2Fcar&key=key", "listings.xml")
     assert_raise(Oodler::OodleArgumentError)  do
        @wc.get("/listings",{:query => {:region => "chicago", :category=>"vehicle/car"}})
     end

   end
    
   should "add the key param to the url" do
      stub_get("/api/v2/listings?region=chicago&category=vehicle%2Fcar&key=key", "listings.xml")
      @wc.get("/listings",{:query => {:region => "chicago", :category=>"vehicle/car"}})
   end
    
  end
end