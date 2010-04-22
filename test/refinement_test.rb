require 'test_helper'

class MyTest < Test::Unit::TestCase

 context "when creating new refinements" do

    should "parse the  refinement xml correctly" do
      object = Oodler::Refinement.from_xml("<element><name>Job Title</name><values><element><name>Manager</name><count>4</count><id>job_title_manager</id></element></values></element>")
      object.name.should == "Job Title"
      object.values.should_not be_empty
      object.values[0].name.should == "Manager"
    end

     should "parse the  refinements xml correctly" do
      object = Oodler::Refinements.from_xml("<refinements><attributes><element><name>Job Title</name><values><element><name>Manager</name><count>4</count><id>job_title_manager</id></element></values></element></attributes></refinements>")
  
      object.values.should_not be_empty

    end
  end
end