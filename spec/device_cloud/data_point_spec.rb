require 'spec_helper'


describe DeviceCloud::DataPoint do

  subject(:data_point) do
    DeviceCloud::DataPoint.parse(xml).first
  end

  let(:xml) do
    <<-XML
      <?xml version="1.0" encoding="ISO-8859-1" ?>
      <result>
        <resultSize>2</resultSize>
        <requestedSize>1000</requestedSize>
        <pageCursor>51075196-53b4-11e3-8b51-bc764e113426</pageCursor>
        <requestedStartTime>-1</requestedStartTime>
        <requestedEndTime>-1</requestedEndTime>
        <DataPoint>
          <id>cfc57f41-520e-11e3-8b51-bc764e113426</id>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a2004063d301/battery</streamId>
          <timestamp>1384970932009</timestamp>
          <serverTimestamp>1384970934108</serverTimestamp>
          <data>5.5</data>
          <description/>
          <quality>0</quality>
        </DataPoint>
        <DataPoint>
          <id>13b7174e-520f-11e3-8092-bc764e105279</id>
          <cstId>5940</cstId>
          <streamId>dia/channel/00000000-00000000-00409DFF-FF725771/0013a2004063d301/battery</streamId>
          <timestamp>1384971046000</timestamp>
          <serverTimestamp>1384971052748</serverTimestamp>
          <data>4.45</data>
          <description/>
          <quality>0</quality>
        </DataPoint>
      </result>
    XML
  end

  describe ".parse" do
    it "will return a data point for each object" do
      result = DeviceCloud::DataPoint.parse xml
      expect(result.count).to eql 2
    end
    context "the xml to parse is empty" do
      it "will raise an InvalidResultError" do
        expect { DeviceCloud::DataPoint.parse "" }.to raise_error DeviceCloud::InvalidResultError
      end
    end
  end

  describe "#id" do
    it "will return the data point id" do
      expect(data_point.id).to eql "cfc57f41-520e-11e3-8b51-bc764e113426"
    end
  end

  describe "#value" do
    it "will return the data points value" do
      expect(data_point.value).to eql "5.5"
    end
  end

  describe "#timestamp" do
    it "returns the timestamp of the data point" do
      expect(Time.at(data_point.timestamp.to_i)).to eql Time.parse("2013-11-20T13:8:52-05:00")
    end
  end

  describe "#stream_id" do
    it "returns the id for for the DataStream that represents these DataPoints" do
      expect(data_point.stream_id).to eql "dia/channel/00000000-00000000-00409DFF-FF725771/0013a2004063d301/battery"
    end
  end

end