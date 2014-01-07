require 'spec_helper'

describe ".api_key" do
  it "should have a key" do
    ArcticElvis.api_key.should eq ArcticElvis::Configuration::DEFAULT_API_KEY
  end
end

describe '.configure' do
  it "should set the api_key" do
    ArcticElvis.configure do |config|
      config.api_key = "123"
      ArcticElvis.api_key.should eq "123"
    end
  end
end