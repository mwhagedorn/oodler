require 'test_helper'

class ElementTest < Test::Unit::TestCase

  should "parse element correctly from xml" do
    element = Oodler::Element.from_xml('<element>
			<id>1900074984</id>
			<title>2010 Chrysler Town &amp; Country Touring</title>
			<body>Driver manual lumbar adjust, Active headrests, Front center console w/cupholder, Pwr adjustable pedals, Tip start, Tilt steering column, Leather-wrapped steering wheel, Steering wheel audio controls, Trip computer w/temp &amp; compass, Door ajar warning light, Sliding door alert, Low washer fluid warning signal, Dark maple/silver instrument panel bezel, Satin silver instrument panel bezel center stack, Pwr front windows w/one-touch, 2nd row pwr windows, Pwr rear quarter vent windows, Pwr door locks, Keyless entry w/immobilizer, Speed control, Universal garage door opener, Rear window defroster, Analog clock, Dual glove boxes, Lower instrument panel cubby bin, Cupholders w/overhead illumination, Front/rear 12V DC pwr outlets, 12V auxiliary pwr outlets, 115V pwr outlet, Driver door sill storage bin, Door trim panel w/dark maple accents, Illuminated front door storage, Interior observation mirror, Overhead console, Overhead storage bins, Rear overhead console, Visors w/illuminated vanity mirrors</body>
			<url>http://cars.oodle.com/r_a2xx_/1900074984-11202p454,10-EST/www.everycarlisted.com___chKLl2fSDGxSt6l73uN6064DyBKKek7cFjfdds1IVF0TXnFPtwBGejSLLeJvnwcNbSGADeRrrSEW8TQWmq9mTnxTRMpCVoogInIUUrMi4fVYmgrW86CjxEqU3RRWlP5g</url>
			<category>
				<id>vehicle/car</id>
				<name>Cars</name>
			</category>
			<source>
				<id>everycarlisted-bronze</id>
				<name>EveryCarListed.com</name>
			</source>
			<location>
				<latitude>42.0657997</latitude>
				<longitude>-87.9197998</longitude>
				<address>77 Rand Rd</address>
				<zip>60016</zip>
				<addresscode>addr:usa:il:desplaines:77+rand+rd</addresscode>
				<citycode>usa:il:desplaines</citycode>
				<name>Des Plaines</name>
				<state>IL</state>
				<country>USA</country>
			</location>
			<images>
				<element>
					<src>http://i.oodleimg.com/item/1900074984_1m?1271160266</src>
					<width>144</width>
					<height>108</height>
					<alt>2010 Chrysler Town &amp; Country T</alt>
				</element>
				<element>
					<src>http://i.oodleimg.com/item/1900074984_1s?1271160266</src>
					<width>112</width>
					<height>84</height>
					<alt>2010 Chrysler Town &amp; Country T</alt>
				</element>
			</images>
			<ctime>1271160145</ctime>
			<paid>Yes</paid>
			<revenue_score>10</revenue_score>
			<similar_url>http://cars.oodle.com/2009_2011-hrysler-town_and_country/chicago-area/price_27000_36000/mileage_0_20000/?inbs=1</similar_url>
			<attributes>
				<color>Blue</color>
				<condition>New</condition>
				<currency>USD</currency>
				<dealer_id>Advantage Chrysler Jeep Dodge of Des Pla</dealer_id>
				<delivery>Local Delivery</delivery>
				<engine_type>4.0L V6 24V MPFI SOHC</engine_type>
				<features>Trip Computer,Keyless Entry,Clock,Center Console,Air Conditioning,Air Bags</features>
				<fee>No</fee>
				<has_photo>Thumbnail</has_photo>
				<make>Chrysler</make>
				<mileage>2</mileage>
				<model>Town and Country</model>
				<price>31415</price>
				<price_display>$31,415</price_display>
				<seller_type>Dealer</seller_type>
				<transmission>Automatic</transmission>
				<trim>Touring</trim>
				<vin>2A4RR5DX9AR201012</vin>
				<year>2010</year>
			</attributes>
		</element>')

    element.id.should == "1900074984"
    element.category.name.should == "Cars"
    element.location.latitude.should == "42.0657997"
    element.images.size.should == 2
    element.images.first.src.should == "http://i.oodleimg.com/item/1900074984_1m?1271160266"
    element.paid?.should == true
    element.properties.keys.size.should == 19
    element.properties["color"].should == "Blue"
    element.properties["mileage"].should == "2"




  end
end