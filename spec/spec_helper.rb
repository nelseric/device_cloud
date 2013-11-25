$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require "device_cloud"

require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end