module Oodler
  class Region
    include ROXML
    xml_reader :id
    xml_reader :name 
  end
end