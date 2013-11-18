require "nokogiri"
module DeviceCloud
  class Monitor

    RESOURCE_PATH = "/ws/Monitor"

    attr_accessor :topic, :id, :element

    def self.all(client)
      xml_result = Nokogiri::XML.parse client.get RESOURCE_PATH
      xml_result.xpath("//result/Monitor").map { |monitor| parse monitor }
    end

    def self.parse(xml)
      topic = xml.xpath("monTopic").text
      DeviceCloud::Monitor.new(topic, xml)
    end

    def initialize(topic, element = nil)
      @topic = topic
      @element = element
    end

    def resource_path
      RESOURCE_PATH
    end


    def save(client)
      response = client.post resource_path, build.to_xml
      xml_res = Nokogiri::XML.parse response
      @id = xml_res.xpath("//result/location").text
    end

    def delete(client)
      raise NotImplementedError, "Incomplete"
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