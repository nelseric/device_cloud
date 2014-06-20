require "spec_helper"

describe DeviceCloud::Config do

  subject(:config) do
    DeviceCloud::Config.new(:username => username, :password => password, :host => host, :protocol => protocol)
  end
  let(:username) { "testl-user" }
  let(:password) { "test-pass" }
  let(:host) { "login.etherios.com" }
  let(:protocol) { "https" }

  it "sets provided values" do
    expect(config.host).to eql host
    expect(config.protocol).to eql protocol
    expect(config.username).to eql username
    expect(config.password).to eql password
  end
  context "No options are provided" do
    subject(:config) { DeviceCloud::Config.new({}) }
    it "has default values" do
      expect(config.host).to eql "login.etherios.com"
      expect(config.protocol).to eql "https"
      expect(config.username).to eql ""
      expect(config.password).to eql ""
    end
  end
end
