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

    def data_streams(stream_path, params = {})
      DataStream.parse(get "#{DataStream::RESOURCE_PATH}/#{stream_path}?#{ to_params params }")
    end

    def data_points(stream_id, params = {})
      DataPoint.parse(get "/ws/DataPoint/#{stream_id}?#{ to_params params }")
    end

    def get(path, *args)
      RestClient.get base_url + path, *args
    end

    def put(path, *args)
      RestClient.put base_url + path, *args
    end

    def post(path, *args)
      RestClient.post base_url + path, *args
    end

    def delete(path, *args)
      RestClient.delete base_url + path, *args
    end

    def base_url
      "#{config.protocol}://#{escaped_username}:#{escaped_password}@#{config.host}"
    end

    def escaped_username
      # URI.encode does not encode @ symbols
      CGI.escape config.username
    end

    def escaped_password
      CGI.escape config.password
    end

    private
    def to_params(hash)
      hash.each_pair.map do |key, value|
        key + "=" + value
      end.inject { |a, b| a + "&" + b }
    end
  end
end
