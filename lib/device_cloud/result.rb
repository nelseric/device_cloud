require "nokogiri"
module DeviceCloud
  class Result
    include Enumerable

    attr_accessor :document

    def initialize(xml)
      @document = Nokogiri::XML.parse(xml)
    end

    def total
      @document.xpath("//result/resultTotalRows").text.to_i
    end

    def offset
      @document.xpath("//result/requestedStartRow").text.to_i
    end

    def count
      @document.xpath("//result/resultSize").text.to_i
    end

    def requested
      @document.xpath("//result/requestedSize").text.to_i
    end

  end
end