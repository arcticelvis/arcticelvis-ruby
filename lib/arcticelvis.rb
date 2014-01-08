require "arcticelvis/version"
require "arcticelvis/configuration"
require "arcticelvis/request"
require "arcticelvis/base"
require "arcticelvis/event"
require "arcticelvis/event_message"


module Arcticelvis
  extend Configuration

  class ArcticelvisError < StandardError; end
  class AuthenticationError < ArcticelvisError; end
  class InvalidOptionsError < ArcticelvisError; end
  class RecordNotFoundError < ArcticelvisError; end
  
  class << self
    def request(http_method, api_url, data)
      Request.new(http_method, api_url, data).perform
    end
  end
end
