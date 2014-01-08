require 'spec_helper'

describe Arcticelvis::Event do
  before do
    Arcticelvis.configure do |config|
      config.api_key = 'abc'
    end
  end


  describe ".find" do
    
    describe "failure" do
      it "should raise RecordNotFoundError when no event is found" do
        VCR.use_cassette('event_404') do
          expect {Arcticelvis::Event.find("123")}.to raise_exception Arcticelvis::RecordNotFoundError
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
        event = Arcticelvis::Event.find("177")
        event.should be_a(Arcticelvis::Event)
        event.name.should eq "New user"
      end

      it "gives you an array of event messages" do
        event = Arcticelvis::Event.find("177")
        event.event_messages[0].should be_a(Arcticelvis::EventMessage)
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
        event = Arcticelvis::Event.new(id: '177')
        
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
          event = Arcticelvis::Event.new(id: '1')
        
          expect{
            event.trigger({
              to: 'ch@skalar.no',
              payload: {
                name: "Arctic"
              }
            })
          }.to raise_exception Arcticelvis::RecordNotFoundError

        end
      end

      it "raises exception if the event is paused" do
      end
    end
    
  end
end