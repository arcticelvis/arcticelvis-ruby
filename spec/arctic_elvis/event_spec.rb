require 'spec_helper'

describe ArcticElvis::Event do
  before do
    ArcticElvis.configure do |config|
      config.api_key = '123'
    end
  end


  describe ".find" do
    
    it "makes a GET request to the api-endpoint to fetch a specific event" do
      ArcticElvis.should_receive(:request).with(:get, "events/123", {}).and_return("event" => {})
      ArcticElvis::Event.find("123")
    end

    it "gives you an event object" do
      ArcticElvis.should_receive(:request).with(:get, "events/123", {}).and_return("event" => {"name" => "Signup event"})
      event = ArcticElvis::Event.find("123")
      event.should be_a(ArcticElvis::Event)
      event.name.should eq "Signup event"
    end

    it "gives you an array of event messages" do
      ArcticElvis.should_receive(:request).with(:get, "events/123", {}).and_return("event" => {"name" => "Signup event", "event_messages" => [{"subject" => "Welcome mail"}]})
      event = ArcticElvis::Event.find("123")
      event.event_messages[0].should be_a(ArcticElvis::EventMessage)
      event.event_messages[0].subject.should eq "Welcome mail"
    end
    
  end

  describe ".trigger" do
    it "makes a POST request to the api-endpoint to fetch a specific event" do
      params = {
        email: 'ch@skalar.no',
        payload: {
          name: "Arctic"
        }
      }
      ArcticElvis.should_receive(:request).with(:post, "events/1/trigger", params).and_return("event_instance" => {})
      event = ArcticElvis::Event.new(id: '1')
      event.trigger({
        to: 'ch@skalar.no',
        payload: {
          name: "Arctic"
        }
      })
    end
  end
end