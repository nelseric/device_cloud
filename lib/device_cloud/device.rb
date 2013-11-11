require "device_cloud/result"

module DeviceCloud
  class DeviceCore < DeviceCloud::Result
    def self.parse(xml)
      result = Result.new(xml)
      result.document.xpath("//result/DeviceCore").map do |device|
        DeviceCloud::DeviceCore.new device
      end
    end

    def initialize element
      @element = element
    end
  end
end