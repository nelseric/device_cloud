require "spec_helper"

describe DeviceCloud::Monitor do
  subject(:monitor) do
    DeviceCloud::Monitor.new(topic)
  end

  let(:client) { DeviceCloud::Client.new(:username => "test", :password => "test") }

  let(:api_stub) { stub_request :any, /#{client.base_url}.*/ }

  let(:topic) { "DiaChannelDataFull" }

  describe "#build" do
    let(:document) { monitor.build.doc }
    it 'it will have the correct topic' do
      expect(document.xpath("//Monitor/monTopic").text).to eql topic
      monitor.topic = "DeviceCore,DataStream"
      expect(document.xpath("//Monitor/monTopic").text).to eql topic
    end
  end


  describe "#save" do
    before do
      api_stub
    end
    it "will POST to $base/ws/Monitor" do
      monitor.save(client)
      expect(a_request(:post, client.base_url + "/ws/Monitor")).to have_been_made
    end
  end

  describe "all" do
    before do
      api_stub
    end
    it "gets on the root of monitor" do
      DeviceCloud::Monitor.all(client)
      expect(a_request(:get, client.base_url + "/ws/Monitor")).to have_been_made
    end
  end
end
