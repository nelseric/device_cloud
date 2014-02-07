require 'spec_helper'

describe DeviceCloud::DataStream do

  subject(:data_stream) do
    DeviceCloud::DataStream.parse(xml).first
  end

  let(:xml) do
    <<-XML
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <result>
       <resultSize>4</resultSize>
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
    </result>
    XML
  end

  describe ".parse" do
    it "will return an array containing a data stream for each stream in the xml" do
      expect(DeviceCloud::DataStream.parse(xml).count).to eql 4
    end
  end

  describe "#delete" do
    it "will use the client to delete the stream" do
      client = double("DeviceCloud::Client", :delete => nil)

      data_stream.delete(client)

      expect(client).to have_received(:delete).with("/ws/DataStream/dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52e1d/distance")
    end
  end

  describe "#value" do
    it "returns the current value of the stream" do
      expect(data_stream.value).to eql "44.2"
    end
  end

  describe "#timestamp" do
    it "returns the timestamp of the current datapoint for the stream" do
      expect(Time.at(data_stream.timestamp.to_i)).to eql Time.parse("2013-11-22T15:26:06-05:00")
    end
  end

  describe "#current_id" do
    it "returns the id of the current datapoint for the stream" do
      expect(data_stream.current_id).to eql "5101f920-53b4-11e3-8b51-bc764e113426"
    end
  end

  describe "#stream_id" do
    it "returns the stream id" do
      expect(data_stream.stream_id).to eql "dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52e1d/distance"
    end
  end

  describe "#device_id" do
    it "returns the device id out of the stream_id" do
      expect(data_stream.device_id).to eql "00000000-00000000-00409DFF-FF725771"
    end
  end

  describe "#path" do
    it "returns the path of the datastream, which is the part of the streamId between the stream name and device_id" do
      expect(data_stream.path).to eql "0013a20040a52e1d"
    end
  end
  describe "#mac" do
    it "returns the sensor mac from the device id and converts it to an integer" do
      expect(data_stream.mac).to eql "0013a20040a52e1d".to_i(16)
    end
  end

  describe "#name" do
    it "returns the stream name" do
      expect(data_stream.name).to eql "distance"
    end
  end

  describe "#device_path" do
    it "generates the path for the sensor from any stream belonging to the device" do
      expect(data_stream.device_path).to eql "dia/channel/00000000-00000000-00409DFF-FF725771/0013a20040a52e1d/"
    end
  end
end