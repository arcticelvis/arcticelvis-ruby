require "arctic_elvis/version"
require "arctic_elvis/configuration"
require "arctic_elvis/request"
require "arctic_elvis/base"
require "arctic_elvis/event"
require "arctic_elvis/event_message"


module ArcticElvis
  extend Configuration

  class ArcticElvisError < StandardError; end
  class AuthenticationError < ArcticElvisError; end

  class << self
    def request(http_method, api_url, data)
      Request.new(http_method, api_url, data).perform
    end
  end
end
