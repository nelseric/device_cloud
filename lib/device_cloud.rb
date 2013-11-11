require "device_cloud/version"
require "device_cloud/config"
require "device_cloud/device_core"
require "device_cloud/data_stream"
require "device_cloud/data_point"
require "device_cloud/result"

require "rest-client"
module DeviceCloud

  def devices(params = "")
    DeviceCore.parse(RestClient.get base_url + "/ws/DeviceCore/#{params}")
  end

  def data_streams(params = "")
    DataStream.parse(RestClient.get base_url + "/ws/DataStream/#{params}")
  end

  def data_points(stream_id, params = "")
    DataPoint.parse(RestClient.get base_url + "/ws/DataPoint/#{stream_id}?#{params}")
  end


  #private
  def base_url
    "https://#{Config.username}:#{Config.password}@login.etherios.com"
  end
end

