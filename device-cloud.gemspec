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

  spec.add_dependency "nokogiri"
  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "libnotify"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "timecop"


end
