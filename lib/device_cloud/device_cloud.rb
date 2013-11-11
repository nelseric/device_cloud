require "device_cloud/version"
require "device_cloud/device"


require "rest-client"
include "singleton"
module DeviceCloud
  def initialize username, password
    @username = username
    @password = password
  end

  def devices
    Response.parse(RestClient.get base_url + "ws/DeviceCore")
  end

  private
  def base_url
    "https://#{@username}:#{@password}@login.etherios.com"
  end
end
