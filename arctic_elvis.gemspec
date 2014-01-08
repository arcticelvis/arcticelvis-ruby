# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arctic_elvis/version'

Gem::Specification.new do |spec|
  spec.name          = "arctic_elvis"
  spec.version       = ArcticElvis::VERSION
  spec.authors       = ["Christian Hager"]
  spec.email         = ["persson.hager@gmail.com"]
  spec.summary       = %q{A client for the ArcticElvis API}
  spec.description   = %q{ArcticElvis will help you get more fish, aka sell more. This is a fishing pole.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8.8"
  spec.add_dependency "json", "~> 1.8.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  #spec.add_development_dependency "vcr", "~> 2.8.0"
  #spec.add_development_dependency "webmock"
end
