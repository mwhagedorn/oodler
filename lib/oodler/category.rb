module Oodler
  class Category
    include ROXML
      xml_reader :id
      xml_reader :name
      xml_reader :abbrev
  end
  
end