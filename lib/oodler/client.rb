module Oodler
  class Client
    include HTTParty
    
    attr_reader :key, :http_options
    
    def initialize(key=Oodler.key,options={})
      @key, @http_options = key,options
    end
    
    def web_client
        @web_client ||= Oodler::WebClient.new(@key)
    end
   
    
    def get(path, options={})
      path = "/listings#{path}"
      validate_parameters(options)
      response = web_client.get(path, options)
      raise_errors(response)
      response.body
    end

    #client.search("chicago", {:category =>"vehicle/cars"})
    def search( region, options={})
      path = ""

      options= {:query =>options}
      options[:query].merge!({:region => region}) if region
      
      OodleResponse.from_xml(get(path, options))
    end

    #helper method - client.search_by_category("chicago", "vehicle/car")
    def search_by_category(region,category, options={})
      path=""
      options= {:query =>options}
      options[:query].merge!({:region => region}) if region
      options[:query].merge!({:category => category}) if category

      OodleResponse.from_xml(get(path, options))

    end
    

    #the generic pash a hash version
    #example client.listing(:region=>"chicago", :category => "vehicle/car")
    #returns an OodleResponse
    def listing(options={})
      path = ""
      options= {:query =>options}
      OodleResponse.from_xml(get(path, options))
    end
    
    private
        
      def validate_parameters(options)
        params = options[:query]
        unless params[:region]
          raise OodleArgumentError, 'Missing region paramter. Visit http://developer.oodle.com/regions-list/ for possible regions.'
        end
        unless params[:category] || options[:q]
          raise OodleArgumentError, 'You must supply a category or query parameter. Visit http://developer.oodle.com/categories-list/ for possible categories.'
        end
      end

      def raise_errors(response)
        if response["oodle_response"]["error"]
          data = response["oodle_response"]["error"]
          raise OodlerError.new(data), "(fail: #{data}"
        end

      end

      

  end
end