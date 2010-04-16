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
      options.merge!({:region => region})
      self.listing(options)
    end

    #helper method - client.search_by_category("chicago", "vehicle/car")
    def search_by_category(region,category, options={})
      options.merge!({:region => region}) if region
      options.merge!({:category => category}) if category
      self.listing(options)

    end

    #specify the :location key for city search, i.e :location=>"Houston, Tx"
    def usa_job_search(options)
      options.merge!({:region => "usa"})
      options.merge!({:category => "job"})
      self.listing(options)
    end
    

    #the generic pash a hash version
    #example client.listing(:region=>"chicago", :category => "vehicle/car")
    #returns an OodleResponse
    def listing(options={})
      path = ""
      options= {:query =>options}
      OodleResponse.from_xml(get(path, options))
    end

    def job_title_attribute(title)
        "job_title_#{title}"
    end

    def industry_attribute(title)
         "industry_#{title}"
    end

    def company_attribute(title)
         "company_#{title}"
    end

    def job_type_attribute(string)
         "job_type_#{title}"
    end
    
    private
        
      def validate_parameters(options)

        params = options[:query]
   
        unless params[:region]
          raise OodleArgumentError, 'Missing region parameter. Visit http://developer.oodle.com/regions-list/ for possible regions.'
        end
        unless params[:category] || params[:q]
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