module Oodler
  class Location
    include ROXML
    xml_reader :latitude
    xml_reader :longitude
    xml_reader :address
    xml_reader :zip
    xml_reader :addresscode
    xml_reader :citycode
    xml_reader :name
    xml_reader :state
    xml_reader :country
    
  end
end