module Oodler
  class OodleResponse
    include ROXML
    xml_reader :region, :as => Region, :in => "current"
    xml_reader :category, :as => Category, :in => "current"
    xml_reader :elements, :as =>[Element], :in => "listings"
    xml_reader :start, :in =>"current"
    xml_reader :num, :in => "current"
    xml_reader :stat, :from => :attr
    xml_reader :error

    def listings
      elements
    end
  end

end