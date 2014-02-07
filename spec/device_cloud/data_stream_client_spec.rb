require 'spec_helper'

require 'timecop'

describe DeviceCloud::DataStreamClient do
  subject(:data_stream_client) { DeviceCloud::DataStreamClient.new config, client }
  let(:client) { double("DeviceCloud::Client", :get => xml) }
  let(:config) { {"ttl" => 55} }

  let(:xml) do
    <<-XML
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <result>
       <resultSize>8</resultSize>
       <requestedSize>1000</requestedSize>
       <pageCursor>76cab9ad-5-ebd5ccac</pageCursor>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52e1d/distance</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>5101f920-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151966954</timestamp>
             <serverTimestamp>1385151968249</serverTimestamp>
             <data>44.2</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a2004063d301/distance</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>510c337d-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151967021</timestamp>
             <serverTimestamp>1385151968488</serverTimestamp>
             <data>0.0</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a200408cb965/distance</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>50e8a4e8-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151966788</timestamp>
             <serverTimestamp>1385151968064</serverTimestamp>
             <data>0.0</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52b7a/distance</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>50f1cc94-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151966848</timestamp>
             <serverTimestamp>1385151968068</serverTimestamp>
             <data>0.0</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52e1d/temperature</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>5101f920-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151966954</timestamp>
             <serverTimestamp>1385151968249</serverTimestamp>
             <data>44.2</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a2004063d301/temperature</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>510c337d-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151967021</timestamp>
             <serverTimestamp>1385151968488</serverTimestamp>
             <data>21.2</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a200408cb965/temperature</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>50e8a4e8-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151966788</timestamp>
             <serverTimestamp>1385151968064</serverTimestamp>
             <data>20.0</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
       <DataStream>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52b7a/temperature</streamId>
          <dataType>DOUBLE</dataType>
          <forwardTo/>
          <currentValue>
             <id>50f1cc94-53b4-11e3-8b51-bc764e113426</id>
             <timestamp>1385151966848</timestamp>
             <serverTimestamp>1385151968068</serverTimestamp>
             <data>32.2</data>
             <description/>
             <quality>0</quality>
          </currentValue>
          <description/>
          <units>in</units>
          <dataTtl>2678400</dataTtl>
          <rollupTtl>8035200</rollupTtl>
       </DataStream>
    </result>
    XML
  end


  describe "#valid?" do
    before :each do
      Timecop.freeze
    end

    context("The cache has not been updated") do
      it "will return false" do
        expect(data_stream_client.valid?).to eql false
      end
    end

    context("A request has recently been made") do
      before(:each) do
        data_stream_client.cache
        Timecop.travel Time.now + 10
      end

      it "will return true" do
        expect(data_stream_client.valid?).to eql true
      end
    end

    after(:each) do
      Timecop.return
    end
  end

  describe "#devices" do
    it "will return a data for every (device_id)/(path)/..." do

      device_list = [{device_id: "00000000-00000000-00409DFF-FF725771", path: "0013a20040a52e1d"},
                     {device_id: "00000000-00000000-00409DFF-FF725771", path: "0013a2004063d301"},
                     {device_id: "00000000-00000000-00409DFF-FF725771", path: "0013a200408cb965"},
                     {device_id: "00000000-00000000-00409DFF-FF725771", path: "0013a20040a52b7a"}]


      expect(data_stream_client.devices).to eql device_list
    end
  end

  describe "#match" do
    context "when the streams requested exit" do
      it "returns a datastream object for each matched stream" do
        streams = data_stream_client.match(".*/distance")
        expect(streams.count).to eql 4
        streams.each do |stream|
          expect(stream.name).to eql "distance"
        end
      end
    end

    context "the requested stream does not exist" do
      it "returns an empty array" do
        expect(data_stream_client.match("foo")).to be_empty
      end
    end
  end


  describe "#invalidate" do
    context "the cache is valid" do
      before :each do
        Timecop.freeze
        data_stream_client.cache
      end

      after :each do
        Timecop.return
      end

      it "sets last_updated to nil" do
        expect { data_stream_client.invalidate }.to change { data_stream_client.last_updated }.from(Time.now).to nil
      end
    end
  end

  describe "#cache" do
    let(:stream) { double("DeviceCloud::DataStream") }
    before :each do
      DeviceCloud::DataStream.stub(:parse => [stream])
      Timecop.freeze
    end

    context "The cache is invalid" do
      it "will update the cache age" do
        expect { data_stream_client.cache }.to change { data_stream_client.last_updated }.to Time.now
      end

      it "will set the raw cache to the request xml" do
        expect { data_stream_client.cache }.to change { data_stream_client.raw_cache }.to xml
      end

      it "will return the cache parsed as an array DataStreams" do
        expect(data_stream_client.cache).to eql [stream]
        expect(DeviceCloud::DataStream).to have_received(:parse).with(xml)
      end
    end

    context "The cache is valid" do
      before :each do
        data_stream_client.stub(:valid? => true, :parsed_cache => [stream])
      end

      it "will only return the current cache value" do
        expect(data_stream_client.cache).to eql [stream]
        expect(DeviceCloud::DataStream).not_to have_received(:parse)
      end
    end

    after :each do
      Timecop.return
    end
  end

  let(:serialized) { "--- !ruby/object:DeviceCloud::DataStreamCache \nttl: 33" }

end
