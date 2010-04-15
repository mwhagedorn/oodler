module Oodler
  class WebClient
     include HTTParty
     
     attr_accessor :key
     base_uri 'api.oodle.com/api/v2/'
     format :xml
     
     def initialize(key=nil)
       @key = key
     end

     def get(path,options)
       options[:query].merge!({:key => @key}) if @key
       validate_parameters(options)
       self.class.get(path,options)
     end

  private
    def validate_parameters(options)
        params = options[:query]
        unless params[:key]
          raise OodleArgumentError, 'Missing API key parameter. Visit http://developer.oodle.com/request-api-key/ to get one'
        end
    end
  end
end