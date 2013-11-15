require "spec_helper"

describe DeviceCloud::Client do
  subject do
    DeviceCloud::Client.new(:username => username, :password => password, :host => host, :protocol => protocol)
  end
  let(:username) { "test" }
  let(:password) { "test" }
  let(:host) { "login.etherios.com" }
  let(:protocol) { "https" }


  it 'will generate a base_url using the configuration' do
    subject.base_url.should == "#{protocol}://#{username}:#{password}@#{host}"
    subject.config.protocol = "http"
    subject.base_url.should == "http://#{username}:#{password}@#{host}"
    subject.config.host = "google.com"
    subject.base_url.should == "http://#{username}:#{password}@google.com"
  end
end