module DeviceCloud
  class Config
    DEFAULT_USERNAME = ""
    DEFAULT_PASSWORD = ""
    DEFAULT_HOST = "login.etherios.com"
    DEFAULT_PROTOCOL = "https"

    attr_accessor :username, :password, :host, :protocol

    def initialize(args)
      @username = args[:username] || DEFAULT_USERNAME
      @password = args[:password] || DEFAULT_PASSWORD
      @host = args[:host] || DEFAULT_HOST
      @protocol = args[:protocol] || DEFAULT_PROTOCOL
    end

  end
end