require "spec_helper"

describe DeviceCloud::DeviceCore do
  subject(:device_core) { DeviceCloud::DeviceCore.parse(xml) }

  let(:xml) do
    <<-XML
      <?xml version="1.0" encoding="ISO-8859-1"?>
      <result>
         <resultTotalRows>2</resultTotalRows>
         <requestedStartRow>0</requestedStartRow>
         <resultSize>2</resultSize>
         <requestedSize>1000</requestedSize>
         <remainingSize>0</remainingSize>
         <DeviceCore>
            <id>
               <devId>747711</devId>
               <devVersion>4</devVersion>
            </id>
            <devRecordStartDate>2013-11-18T15:41:00.000Z</devRecordStartDate>
            <devMac>00:40:9D:70:6F:FF</devMac>
            <devConnectwareId>00000000-00000000-00409DFF-FF706FFF</devConnectwareId>
            <cstId>5940</cstId>
            <grpId>8892</grpId>
            <devEffectiveStartDate>2013-11-18T13:53:00.000Z</devEffectiveStartDate>
            <devTerminated>false</devTerminated>
            <dvVendorId>4261412864</dvVendorId>
            <dpDeviceType>ConnectPort X4</dpDeviceType>
            <dpFirmwareLevel>34603011</dpFirmwareLevel>
            <dpFirmwareLevelDesc>2.16.0.3</dpFirmwareLevelDesc>
            <dpRestrictedStatus>0</dpRestrictedStatus>
            <dpLastKnownIp>192.168.2.10</dpLastKnownIp>
            <dpGlobalIp>99.91.75.14</dpGlobalIp>
            <dpConnectionStatus>1</dpConnectionStatus>
            <dpLastConnectTime>2013-11-22T18:05:45.590Z</dpLastConnectTime>
            <dpContact/>
            <dpDescription>IVX 400 Test Rig</dpDescription>
            <dpLocation/>
            <dpPanId>0x679d</dpPanId>
            <xpExtAddr>00:13:A2:00:40:91:99:29</xpExtAddr>
            <dpServerId>ClientID[15]</dpServerId>
            <dpZigbeeCapabilities>383</dpZigbeeCapabilities>
            <dpCapabilities>68154</dpCapabilities>
            <grpPath>IVX</grpPath>
            <dpLastDisconnectTime>2013-11-18T19:22:51.067Z</dpLastDisconnectTime>
         </DeviceCore>
         <DeviceCore>
            <id>
               <devId>873214</devId>
               <devVersion>4</devVersion>
            </id>
            <devRecordStartDate>2013-11-18T15:41:00.000Z</devRecordStartDate>
            <devMac>00:40:9d:72:57:71</devMac>
            <devConnectwareId>00000000-00000000-00409DFF-FF725771</devConnectwareId>
            <cstId>5940</cstId>
            <grpId>8892</grpId>
            <devEffectiveStartDate>2013-11-18T15:32:00.000Z</devEffectiveStartDate>
            <devTerminated>false</devTerminated>
            <dvVendorId>4261412864</dvVendorId>
            <dpDeviceType>ConnectPort X4</dpDeviceType>
            <dpFirmwareLevel>34603011</dpFirmwareLevel>
            <dpFirmwareLevelDesc>2.16.0.3</dpFirmwareLevelDesc>
            <dpRestrictedStatus>0</dpRestrictedStatus>
            <dpLastKnownIp>192.168.2.58</dpLastKnownIp>
            <dpGlobalIp>99.91.75.14</dpGlobalIp>
            <dpConnectionStatus>0</dpConnectionStatus>
            <dpLastConnectTime>2013-11-22T20:13:17.340Z</dpLastConnectTime>
            <dpContact/>
            <dpDescription>DeLaval IVX</dpDescription>
            <dpLocation/>
            <dpPanId>0x123d</dpPanId>
            <xpExtAddr>00:13:A2:00:40:A4:C1:EC</xpExtAddr>
            <dpServerId/>
            <dpZigbeeCapabilities>383</dpZigbeeCapabilities>
            <dpCapabilities>68154</dpCapabilities>
            <grpPath>IVX</grpPath>
            <dpLastDisconnectTime>2013-11-22T20:56:16.547Z</dpLastDisconnectTime>
         </DeviceCore>
      </result>
    XML
  end

  describe ".parse" do
    it "will return an array containing device core objects" do
      expect(DeviceCloud::DeviceCore.parse(xml).count).to eql 2
    end
    context "the xml is empty" do
      let(:xml) { "" }
      it "will raise an error" do
        expect { DeviceCloud::DeviceCore.parse(xml) }.to raise_error DeviceCloud::InvalidResultError
      end
    end
  end

end