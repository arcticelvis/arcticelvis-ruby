require 'faraday'
require 'json'
module ArcticElvis
  class Request
    
    def initialize(http_method, api_url, data)
      raise ArcticElvis::AuthenticationError if ArcticElvis.api_key.nil?
      @conn = Faraday.new(url: ArcticElvis::Configuration::API_HOST)
      @api_url = api_url
      @data = data
      @http_method = http_method
    end

    def perform
      case @http_method
      when :get
        response = @conn.get do |req|
          req.url "/api/v2/#{@api_url}.json"
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Token token=#{ArcticElvis.api_key}"
        end
      
      when :post
        response = @conn.post do |req|
          req.url "/api/v2/#{@api_url}.json"
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Token token=#{ArcticElvis.api_key}"
          req.body = @data.to_json
        end
      end
      
      if response.body.to_s.include? 'Access denied'
        raise ArcticElvis::AuthenticationError.new("Invalid credentials, is your api key correct?")
      else
        result = JSON.parse(response.body)
      end

      return result, response.status.to_i
    end
  end
end