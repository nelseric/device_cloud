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

    def get_data(params)
      DeviceCloud.data_points(stream_id, params)
    end

    def device_id
      stream_id_parse[1]
    end

    def mac
      stream_id_parse[2].to_i(16)#scan(/.{2}/).inject { |a, b| a + ":" + b }
    end

    private
    def stream_id_parse
      /dia\/channel\/((?:[0-9a-fA-F]{8}-?){4})\/([^\/]*)\//.match stream_id
    end
  end
end