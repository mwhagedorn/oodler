require 'test_helper'

class ImageTest < Test::Unit::TestCase

  should "parse image correctly from xml" do
    image = Oodler::Image.from_xml('<element>
    					<src>http://i.oodleimg.com/item/1900074984_1s?1271160266</src>
    					<width>112</width>
    					<height>84</height>
    					<alt>2010 Chrysler Town &amp; Country T</alt>
    				</element>')
    				
    image.src.should == "http://i.oodleimg.com/item/1900074984_1s?1271160266"
    image.width.should == "112"
    image.height.should == "84"
    
    
    
  end
end