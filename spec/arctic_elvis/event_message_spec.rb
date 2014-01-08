require 'spec_helper'

describe ArcticElvis::EventMessage do
  before do
    ArcticElvis.configure do |config|
      config.api_key = '123'
    end
  end

  describe "preview" do
    it "should fetch the preivew" do
      ArcticElvis.should_receive(:request).with(:post, "events/1/event_messages/2/preview", {}).and_return("event_message" => {"preview" => "<b>Arctic</b>"})
      event_message = ArcticElvis::EventMessage.new({id: "2", event_id: "1"})
      event_message.preview.should eq "<b>Arctic</b>"
    end
  end
end