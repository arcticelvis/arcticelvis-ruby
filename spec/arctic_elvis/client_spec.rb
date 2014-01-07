require 'spec_helper'

describe ArcticElvis::Client do
  it "should inherit configuration" do
    client = ArcticElvis::Client.new(api_key: '123')
    client.api_key.should eq '123'
  end
end