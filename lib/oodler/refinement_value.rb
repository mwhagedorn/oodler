module Oodler
  class RefinementValue
    include ROXML
    xml_name :element
    xml_reader :name
    xml_reader :count
    xml_reader :id
  end
end