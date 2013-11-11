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
  end
end