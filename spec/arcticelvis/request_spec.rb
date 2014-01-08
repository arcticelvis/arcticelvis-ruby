require 'spec_helper'

describe Arcticelvis::Request do
  
  describe "failure" do
    it "should raise ArcticElvis::AuthenticationError if invalid key" do
      VCR.use_cassette('request_4001') do
        expect{
          Arcticelvis::Request.new(:post, "/events/1/trigger", {}).perform
        }.to raise_exception Arcticelvis::AuthenticationError
      end
    end
  end

end