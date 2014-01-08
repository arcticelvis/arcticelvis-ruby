module ArcticElvis
  class EventMessage < Base
    attr_accessor :id, :event_id, :subject, :preview, :state

    def preview(payload={})
      response = ArcticElvis.request(:post, "events/#{event_id}/event_messages/#{id}/preview", payload)
      response["event_message"]["preview"]
    end
  end
end