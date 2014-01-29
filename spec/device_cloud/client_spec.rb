require "spec_helper"

describe DeviceCloud::Client do
  subject(:client) do
    DeviceCloud::Client.new(:username => username, :password => password, :host => host, :protocol => protocol)
  end
  let(:username) { "test" }
  let(:password) { "test" }
  let(:host) { "login.etherios.com" }
  let(:protocol) { "https" }


  it 'will generate a base_url using the configuration' do
    client.base_url.should == "#{protocol}://#{username}:#{password}@#{host}"
    client.config.protocol = "http"
    client.base_url.should == "http://#{username}:#{password}@#{host}"
    client.config.host = "google.com"
    client.base_url.should == "http://#{username}:#{password}@google.com"
  end
end