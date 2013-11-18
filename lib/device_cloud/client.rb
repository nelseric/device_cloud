require "rest-client"

require "device_cloud/config"

module DeviceCloud
  class Client
    attr_accessor :config

    def initialize(config)
      @config = DeviceCloud::Config.new(config)
    end

    def devices(device, params = {})
      DeviceCore.parse(get "/ws/DeviceCore/#{device}?#{ to_params params }")
    end

    def data_streams(stream, params = {})
      DataStream.parse(get "#{DataStream::PATH}/#{stream}?#{ to_params params }")
    end

    def data_points(stream_id, params = {})
      DataPoint.parse(get "/ws/DataPoint/#{stream_id}?#{ to_params params }")
    end


    def get(path, *args)
      RestClient.get base_url + path, args
    end

    def put(path, *args)
      RestClient.put base_url + path, args
    end

    def post(path, *args)
      RestClient.post base_url + path, args
    end

    def delete(path, *args)
      RestClient.delete base_url + path, args
    end

    def base_url
      "#{config.protocol}://#{config.username}:#{config.password}@#{config.host}"
    end

    private
    def to_params(hash)
      hash.each_pair.map do |key, value|
        key + "=" + value
      end.inject { |a, b| a + "&" + b }
    end
  end
end
