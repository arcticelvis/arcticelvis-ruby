module Arcticelvis
  class EventMessage < Base
    attr_accessor :id, :event_id, :subject, :preview, :state

    def preview(payload={})
      response, status = Arcticelvis.request(:post, "events/#{event_id}/event_messages/#{id}/preview", payload)
      raise Arcticelvis::RecordNotFoundError if status == 404
      response["event_message"]["preview"]
    end
  end
end