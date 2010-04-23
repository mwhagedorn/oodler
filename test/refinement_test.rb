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

    should "parse the  contained refinements xml correctly" do
      object = Oodler::OodleResponse.from_xml(fixture_file("refinement.xml"))
      object.refinements.values.should_not be_empty
      object.refinements.values.select{|item| item.name == "Job Title"}.should_not be_empty
      object.refinements.values.select{|item| item.name == "Job Title"}.first.values.should_not  be_empty
      object.refinements.values.select{|item| item.name == "Job Title"}.first.values.first.name.should == "Manager"
      object.refinements.values.select{|item| item.name == "Job Title"}.first.values.first.id.should == "job_title_manager"
      object.refinements.values.select{|item| item.name == "Job Title"}.first.values.collect {|refinement| [refinement.name, refinement.id]}.should == [["Manager", "job_title_manager"], ["Tax Manager", "job_title_tax_manager"], ["Consultant", "job_title_consultant"], ["Analyst", "job_title_analyst"], ["Systems Specialist", "job_title_systems_specialist"], ["Senior Level Deepwater", "job_title_senior_level_deepwater"], ["Senior", "job_title_senior"], ["Representative", "job_title_representative"], ["Program Coordinator", "job_title_program_coordinator"], ["Procurement Process Leader", "job_title_procurement_process_leader"], ["Operations Process Leader", "job_title_operations_process_leader"], ["Operations", "job_title_operations"], ["Are You Looking for a Gas", "job_title_are_you_looking_for_a_gas"], ["Make - Per Hour Making", "job_title_make_per_hour_making"], ["Looking for an Oil Industry", "job_title_looking_for_an_oil_industry"], ["Looking for an Energy", "job_title_looking_for_an_energy"], ["Looking for a Solar Industry", "job_title_looking_for_a_solar_industry"], ["Looking for a Power Industry", "job_title_looking_for_a_power_industry"], ["Looking for a Green Energy", "job_title_looking_for_a_green_energy"], ["Looking for a Gas Industry", "job_title_looking_for_a_gas_industry"], ["Global Sap Procurement Process", "job_title_global_sap_procurement_process"], ["General Manager", "job_title_general_manager"], ["Fluids Specialist", "job_title_fluids_specialist"], ["Environmental Specialist", "job_title_environmental_specialist"], ["Engineer", "job_title_engineer"]]
      

    end
  end
end