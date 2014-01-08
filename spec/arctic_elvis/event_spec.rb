require 'spec_helper'

describe ArcticElvis::Event do
  before do
    ArcticElvis.configure do |config|
      config.api_key = 'abc'
    end
  end


  describe ".find" do
    
    describe "failure" do
      it "should raise RecordNotFoundError when no event is found" do
        VCR.use_cassette('event_404') do
          expect {ArcticElvis::Event.find("123")}.to raise_exception ArcticElvis::RecordNotFoundError
        end
      end
    end

    describe "success" do
      around(:each) do |example|
        VCR.use_cassette('event_200') do
          example.run
        end
      end

      it "makes a GET request to the api-endpoint to fetch a specific event" do
        event = ArcticElvis::Event.find("177")
        event.should be_a(ArcticElvis::Event)
        event.name.should eq "New user"
      end

      it "gives you an array of event messages" do
        event = ArcticElvis::Event.find("177")
        event.event_messages[0].should be_a(ArcticElvis::EventMessage)
        event.event_messages[0].subject.should eq "Welcome"
      end
    end

  end
  describe ".trigger" do
    describe "failure" do
    end

    describe "success" do
      around(:each) do |example|
        VCR.use_cassette('event_trigger_success') do
          example.run
        end
      end

      it "makes a POST request to the api-endpoint to trigger an event and loads the event" do
        event = ArcticElvis::Event.new(id: '177')
        
        expect{
          event.trigger({
            to: 'ch@skalar.no',
            payload: {
              name: "Arctic"
            }
          })
        }.to change{
          event.name
        }.from(nil).to("New user")
      end
    end

    describe "failure" do
      it "raises exception if the event is not found" do
        VCR.use_cassette('event_trigger_404') do
          event = ArcticElvis::Event.new(id: '1')
        
          expect{
            event.trigger({
              to: 'ch@skalar.no',
              payload: {
                name: "Arctic"
              }
            })
          }.to raise_exception ArcticElvis::RecordNotFoundError

        end
      end

      it "raises exception if the event is paused" do
      end
    end
    
  end
end