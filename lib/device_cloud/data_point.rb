require "device_cloud/result"

module DeviceCloud
  class DataPoint
    def self.parse(xml)
      result = Result.new(xml)
      result.document.xpath("//result/DataPoint").map do |data_point|
        DeviceCloud::DataPoint.new data_point
      end
    end

    attr_accessor :element, :id, :value, :timestamp, :stream_id

    def initialize(element)
      #element = element
      @id = element.xpath("id").text
      @value = element.xpath("data").text.to_f
      @timestamp = Time.at(element.xpath("timestamp").text.to_f / 1000)
      @stream_id = element.xpath("stream_id").text
    end
  end
end