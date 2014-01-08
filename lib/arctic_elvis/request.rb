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
          req.url "/api/v2/#{@api_url}"
          #req.headers['Content-Type'] = 'application/json'
          req.headers['X-Authentication'] = "Token token=#{ArcticElvis.api_key}"
        end
      when :post
        response = @conn.post do |req|
          req.url "/api/v2/#{@api_url}"
          req.headers['Content-Type'] = 'application/json'
          req.headers['X-Authentication'] = "Token token=#{ArcticElvis.api_key}"
          req.body = JSON.stringify data
        end
      end

      return JSON.parse(response.body)
    end
  end
end