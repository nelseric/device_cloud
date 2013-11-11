require "device_cloud/version"
require "device_cloud/config"
require "device_cloud/device"

require "rest-client"
module DeviceCloud

  def devices
    Response.parse(RestClient.get base_url + "ws/DeviceCore")
  end

  private
  def base_url
    "https://#{Config.username}:#{Config.password}@login.etherios.com"
  end
end
