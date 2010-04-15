module Oodler
  class Image
    include ROXML
    xml_name :element
    xml_reader :src
    xml_reader :width
    xml_reader :height
    xml_reader :alt
    
    
  end
end