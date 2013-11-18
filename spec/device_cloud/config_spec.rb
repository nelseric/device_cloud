require "spec_helper"

describe DeviceCloud::Config do

  subject do
    DeviceCloud::Config.new(:username => username, :password => password, :host => host, :protocol => protocol)
  end
  let(:username) { "testl-user" }
  let(:password) { "test-pass" }
  let(:host) { "login.etherios.com" }
  let(:protocol) { "https" }

  it "sets provided values" do
    subject.host.should == host
    subject.protocol.should == protocol
    subject.username.should == username
    subject.password.should == password
  end

  it "has default values" do
    config = DeviceCloud::Config.new({})
    config.host.should == "login.etherios.com"
    config.protocol.should == "https"
    config.username.should == ""
    config.password.should == ""
  end
end