module Oodler
  class Element
    include ROXML
    xml_reader :id
    xml_reader :title
    xml_reader :body
    xml_reader :url
    xml_reader :category, :as => Category
    xml_reader :source, :as => Source
    xml_reader :location, :as => Location
    xml_reader :images, :as => [Image], :in =>"images"
    xml_reader :ctime
    xml_reader :paid?
    xml_reader :revenue_score
    xml_reader :similar_url
    xml_reader :properties ,:as => {:key => :name,:value => :content}, :in => "attributes"
    
  end
end