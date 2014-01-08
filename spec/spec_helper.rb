require 'rubygems'
require 'bundler/setup'

require 'arctic_elvis'
require 'vcr'

RSpec.configure do |config|
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.hook_into :webmock # or :fakeweb
  end
end