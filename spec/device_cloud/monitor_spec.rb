require 'rspec'

require "spec_helper"

describe DeviceCloud::Monitor do
  subject do
    DeviceCloud::Monitor.new(topic)
  end

  let(:client) { DeviceCloud::Client.new(:username => "test", :password => "test") }

  let(:api_stub) { stub_request :any, /#{client.base_url}.*/ }

  let(:topic) { "DiaChannelDataFull" }

  describe "#build" do
    let(:document) { subject.build.doc }
    it 'it will have the correct topic' do
      document.xpath("//Monitor/monTopic").text.should == topic
      subject.topic = "DeviceCore,DataStream"
      document.xpath("//Monitor/monTopic").text.should == topic
    end
  end


  describe "#save" do
    before do
      api_stub
    end
    it "should POSTed to $base/ws/Monitor" do
      subject.save(client)
      a_request(:post, client.base_url + "/ws/Monitor").should have_been_made
    end
  end
end