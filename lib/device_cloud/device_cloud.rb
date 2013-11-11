require "device_cloud/version"
require "device_cloud/config"
require "device_cloud/device"
require "device_cloud/result"

require "rest-client"
module DeviceCloud

  def devices
    DeviceCore.parse(RestClient.get base_url + "/ws/DeviceCore")
  end

  #private
  def base_url
    "https://#{Config.username}:#{Config.password}@login.etherios.com"
  end
end

DeviceCloud::Config.load_from_file(File.read(File.expand_path('../../../config/devicecloud.yml', __FILE__)))
