# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'device_cloud/version'

Gem::Specification.new do |spec|
  spec.name = "device_cloud"
  spec.version = DeviceCloud::VERSION
  spec.authors = ["Eric Nelson"]
  spec.email = ["eric@clean-logix.com"]
  spec.description = %q{REST Wrapper for Etherios Devicecloud}
  spec.summary = %q{REST Wrapper for Etherios Devicecloud}
  spec.homepage = ""
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "nori"
  spec.add_dependency "hutch", "~>0.6"
  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "debugger"

end
