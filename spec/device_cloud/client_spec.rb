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

  describe "#devices" do
    let(:result) { "Device Core XML" }
    before :each do
      client.stub(:get => result)
      DeviceCloud::DeviceCore.stub(:parse)
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
