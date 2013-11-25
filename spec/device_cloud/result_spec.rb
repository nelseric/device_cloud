require "spec_helper"

describe DeviceCloud::Result do

  subject do
    DeviceCloud::Result.new xml
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
        <FooBar>
          <Foo>Bar</Foo>
        </FooBar>
        <FooBar>
          <Foo>Bar</Foo>
        </FooBar>
      </result>
    XML
  end


  describe "#count" do
    it "will return the total number of items in the result set" do
      expect(subject.count).to eql 2
    end
  end

  describe "#requested" do
    it "will return the requested maximum size of the of the result dataset" do
      expect(subject.requested).to eql 1000
    end
  end

  context("xml is empty or does not contrain a result root element") do
    let(:xml) { "" }
    it "will raise InvalidResultError" do
      expect { subject }.to raise_error DeviceCloud::InvalidResultError
    end
  end
end