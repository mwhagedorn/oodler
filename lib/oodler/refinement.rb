module Oodler
  class Refinement
    include ROXML
     xml_name :element
    xml_reader :name
    xml_reader :values, :as => [RefinementValue], :in =>"values"
  end
end