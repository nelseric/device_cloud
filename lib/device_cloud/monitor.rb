require "nokogiri"
module DeviceCloud
  class Monitor

    attr_accessor :topic, :id

    def initialize(topic)
      @topic = topic
    end

    def resource_path
      "/ws/Monitor"
    end


    def save(client)
      response = client.post resource_path, build.to_xml
      xml_res = Nokogiri::XML.parse response
      @id = xml_res.xpath("//result/location").text
    end

    def delete(client)
      puts client.delete resource_path
    end

    def update

    end

    def build
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.Monitor {
          xml.monTopic @topic
          xml.monTransportType "http"
          xml.monTransportUrl "https://staging.cleanintel.com/ivx/sync"
          xml.monFormatType "json"
          xml.monBatchSize 100
          xml.monCompression "none"
          xml.monBatchDuration 10
        }
      end
    end
  end
end