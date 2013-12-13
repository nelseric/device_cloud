require "device_cloud/result"

module DeviceCloud
  class DeviceCore

    def self.parse(xml)
      result = Result.new(xml)
      result.document.xpath("//result/DeviceCore").map do |device|
        DeviceCloud::DeviceCore.new device
      end
    end

    attr_accessor :element

    def initialize element
      @element = element
    end

    def device_id
      attribute "devConnectwareId"
    end

    def name
      attribute "dpDescription"
    end

    def connection_state
      attribute("dpConnectionStatus") == "1"
    end

    def last_connect_time
      Time.parse attribute "dpLastConnectTime"
    end

    def last_disconnect_time
      Time.parse attribute "dpLastDisconnectTime"
    end

    def global_ip
      attribute "dpGlobalIp"
    end

    def local_ip
      attribute "dpLastKnownIp"
    end

    private
    def attribute(xpath)
      element.xpath(xpath).text
    end
  end
end