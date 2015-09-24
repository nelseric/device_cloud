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
    expect(client.base_url).to eql "#{protocol}://#{username}:#{password}@#{host}"
    client.config.protocol = "http"
    expect(client.base_url).to eql "http://#{username}:#{password}@#{host}"
    client.config.host = "google.com"
    expect(client.base_url).to eql "http://#{username}:#{password}@google.com"
  end

  describe "#base_url" do
    let(:password) { "|!|\#{&^%*(@)}" }

    it "will url encode username and password" do
      expect { URI.parse(client.base_url) }.not_to raise_error
    end
  end

  describe "#devices" do
    let(:result) { "Device Core XML" }
    before :each do
      allow(client).to receive(:get).and_return(result)
      allow(DeviceCloud::DeviceCore).to receive(:parse)
    end

    context "No parameters" do
      it "will use the correct url" do
        client.devices("*")
        expect(client).to have_received(:get).with("/ws/DeviceCore/*?")
        expect(DeviceCloud::DeviceCore).to have_received(:parse).with(result)
      end
    end

    context "Filtering with parameters" do
      it "will use the correct url" do
        client.devices("*", "grpPath" => "IVX", "test" => "true")
        expect(client).to have_received(:get).with("/ws/DeviceCore/*?grpPath=IVX&test=true")
        expect(DeviceCloud::DeviceCore).to have_received(:parse).with(result)
      end
    end
  end
end
