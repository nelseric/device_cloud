# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'device_cloud/version'

Gem::Specification.new do |spec|
  spec.name = "device-cloud"
  spec.version = DeviceCloud::VERSION.dup
  spec.authors = ["Eric Nelson"]
  spec.email = ["eric@clean-logix.com"]
  spec.description = %q{REST Wrapper for Etherios Devicecloud}
  spec.summary = %q{REST Wrapper for Etherios Devicecloud}
  spec.homepage = "https://github.com/nelseric/device_cloud"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "rest-client", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.18"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "debugger", "~> 1.6"
  spec.add_development_dependency "guard", "~> 2.6"
  spec.add_development_dependency "guard-rspec", "~> 4.2"
  spec.add_development_dependency "guard-bundler", "~> 2.0"
  spec.add_development_dependency "coveralls", "~> 0.7"
  spec.add_development_dependency "timecop", "~> 0.7"


end
