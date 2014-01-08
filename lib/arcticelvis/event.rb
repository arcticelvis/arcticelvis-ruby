module Arcticelvis
  class Event < Base
    attr_accessor :id, :name, :event_messages

    class << self
      def find(id)
        response, status = Arcticelvis.request(:get, "events/#{id}", {})
        raise RecordNotFoundError if status == 404

        event_messages = response["event"]["event_messages"]
        response["event"].delete("event_messages")
        event = self.new(response["event"])

        if event_messages
          res = []
          event_messages.each do |event_message|
            res << Arcticelvis::EventMessage.new(event_message)
          end
        end
        event.event_messages = res if res
        event
      end
    end

    def trigger(options={})
      raise InvalidOptionsError.new("no email given") unless options[:to]
      response, status = Arcticelvis.request(:post, "events/#{id}/trigger", options)
      raise RecordNotFoundError if status == 404
      if status == 201
        set_attributes(response["event_instance"]["event"])
        return self
      end
    end
  end
end