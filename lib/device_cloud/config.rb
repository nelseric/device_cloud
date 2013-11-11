require 'hutch/error_handlers/logger'
require 'logger'

module DeviceCloud
  class UnknownAttributeError < StandardError;
  end

  module Config
    require 'yaml'

    def self.initialize()
      @config = {
          username: 'guest',
          password: 'guest'
      }
    end

    def self.get(attr)
      check_attr(attr)
      user_config[attr]
    end

    def self.set(attr, value)
      check_attr(attr)
      user_config[attr] = value
    end

    class << self
      alias_method :[], :get
      alias_method :[]=, :set
    end

    def self.check_attr(attr)
      unless user_config.key?(attr)
        raise UnknownAttributeError, "#{attr} is not a valid config attribute"
      end
    end

    def self.user_config
      initialize unless @config
      @config
    end

    def self.load_from_file(file)
      YAML.load(file).each do |attr, value|
        DeviceCloud::Config.send("#{attr}=", value)
      end
    end

    def self.method_missing(method, *args, &block)
      attr = method.to_s.sub(/=$/, '').to_sym
      return super unless user_config.key?(attr)

      if method =~ /=$/
        set(attr, args.first)
      else
        get(attr)
      end
    end

    private

    def deep_copy(obj)
      Marshal.load(Marshal.dump(obj))
    end
  end
end