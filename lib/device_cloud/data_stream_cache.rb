require 'device_cloud'

module DeviceCloud
  class DataStreamCache
    attr_accessor :client, :ttl

    attr_reader :last_updated, :raw_cache, :parsed_cache

    def initialize(client, ttl = 60)
      @client = client
      @ttl = ttl
      @last_updated = nil
    end

    def init_with(coder)
      @client = coder["client"]
      @ttl = coder["ttl"] || 60
      @last_updated = nil
    end

    # path is a regex describing the stream id to match
    def data_streams(path)
      cache.select do |stream|
        stream.stream_id.match path
      end
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