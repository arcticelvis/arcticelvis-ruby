require 'spec_helper'

describe ArcticElvis::EventMessage do
  before do
    ArcticElvis.configure do |config|
      config.api_key = 'cd242fb288ddf6e501decb92b84ac0a4'
    end
  end

  describe "preview" do
    describe "failure" do
      it "raises record not found exception if the event message is not found" do
        VCR.use_cassette('event_message_preview_404') do
          event_message = ArcticElvis::EventMessage.new({id: "2", event_id: "1"})
          expect { event_message.preview }.to raise_exception ArcticElvis::RecordNotFoundError
        end
      end
    end

    describe "success" do
      it "should render the payload in the event message and return a preview" do
        VCR.use_cassette('event_message_preview_200') do
          event_message = ArcticElvis::EventMessage.new({id: "235", event_id: "177"})
          event_message.preview({payload: {name: 'Surly you have a name mister!'}}).should include "Surly you have a name mister!"
        end
      end
    end
  end
end