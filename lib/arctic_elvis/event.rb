module ArcticElvis
  class Event < Base
    attr_accessor :id, :name, :event_messages

    class << self
      def find(id)
        response = ArcticElvis.request(:get, "events/#{id}", {})
        event_messages = response["event"]["event_messages"]
        response["event"].delete("event_messages")
        event = self.new(response["event"])

        if event_messages
          res = []
          event_messages.each do |event_message|
            res << ArcticElvis::EventMessage.new(event_message)
          end
        end
        event.event_messages = res if res
        event
      end
    end

    def trigger(options={})
      raise InvalidOptionsError.new("to is required") unless options[:to]
      post_data = {}
      post_data[:email] = options[:to]
      post_data[:payload] = options[:payload]
      response = ArcticElvis.request(:post, "events/#{id}/trigger", post_data)
    end
  end
end