require 'rubygems'
require 'oodler'

# get your api keys at http://developer.oodle.com/request-api-key
client = Oodler::Client.new('your_api_key')



#most generic

client.listing({:region =>"chicago", :category=>"vehicle/cars"})

#other formulations of same search
client.search("chicago", {:category => "vehicle/cars"})
client.search_by_category("chicago",  "vehicle/cars",{})

#adding criteria

