require "device_cloud/result"
module DeviceCloud
  class DataStream
    RESOURCE_PATH = '/ws/DataStream'

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

    def delete(client)
      client.delete RESOURCE_PATH + "/" + stream_id
    end

    def value
      current.value
    end

    def timestamp
      current.timestamp
    end

    def current_id
      current.id
    end

    def stream_id
      element.xpath("streamId").text
    end

    def device_id
      stream_id_parse[1]
    end

    def mac
      path.to_i(16)
    end

    def path
      stream_id_parse[2]
    end

    def name
      stream_id_parse[3]
    end

    def device_path
      "dia/channel/#{device_id}/#{mac.to_s(16).rjust(16,"0")}/"
    end

    private

    def stream_id_parse
      /dia\/channel\/((?:[0-9a-fA-F]{8}-?){4})\/([^\/]*)\/([a-z_]*)/.match stream_id
    end

    def current
      DataPoint.new(element.xpath("currentValue"))
    end
  end
end