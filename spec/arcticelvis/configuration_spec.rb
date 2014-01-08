require 'spec_helper'

describe ".api_key" do
  it "should have a key" do
    Arcticelvis.api_key.should eq Arcticelvis::Configuration::DEFAULT_API_KEY
  end
end

describe '.configure' do
  it "should set the api_key" do
    Arcticelvis.configure do |config|
      config.api_key = "123"
      Arcticelvis.api_key.should eq "123"
    end
  end
end