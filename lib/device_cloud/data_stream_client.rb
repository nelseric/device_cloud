require 'device_cloud'

module DeviceCloud
  class DataStreamClient
    attr_accessor :client, :ttl

    attr_reader :last_updated, :raw_cache, :parsed_cache

    def initialize(config, client = nil)
      @client = client || Client.new(config)
      @ttl = config["ttl"] || 60
      @last_updated = nil
    end

    # match the stream_id against regex
    def match(regex)
      cache.select do |stream|
        stream.stream_id.match regex
      end
    end

    def devices
      cache.map do |stream|
        {
            device_id: stream.device_id,
            path: stream.path
        }
      end.uniq
    end

    def invalidate
      @last_updated = nil
    end

    def valid?
      !@last_updated.nil? and (Time.now - @ttl) < @last_updated
    end

    def cache
      if !valid? || parsed_cache.nil?
        # We need to update the cache

        # Get all streams, and we will parse it out using xpath.
        @raw_cache = client.get DataStream::RESOURCE_PATH
        @parsed_cache = DataStream.parse raw_cache
        #get the thing
        @last_updated = Time.now
      end
      parsed_cache
    end
  end
end