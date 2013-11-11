require "device_cloud/result"
module DeviceCloud
  class DataStream
    def self.parse(xml)
      result = Result.new(xml)
      result.document.xpath("//result/DataStream").map do |stream|
        DeviceCloud::DataStream.new stream
      end
    end

    attr_accessor :element

    def initialize(element)
      @element = element
    end

    def current
      DataPoint.new(@element.xpath("currentValue"))
    end

    def stream_id
      @element.xpath("streamId").text
    end
  end
end