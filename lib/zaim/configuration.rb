require 'zaim/configuration'
require 'zaim/default'
require 'zaim/version'

module Zaim
  module Configuration

    extend Forwardable

    attr_accessor :consumer_key, :api_version, :user_agent
    attr_writer :consumer_secret
    def_delegator :options, :hash

    ENDPOINT = 'https://api.zaim.net/'.freeze unless defined? Zaim::Configuration::ENDPOINT

    class << self

      def keys
        @keys ||= [
          :consumer_key,
          :consumer_secret,
          :api_version,
          :user_agent
        ]
      end

    end

    def configure
      yield self
      self
    end

    def reset!
      Zaim::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", Zaim::Default.options[key])
      end
      self
    end

    # Prevent auth required access without {Zaim::Client}
    #
    # @return [Boolean]
    def credentials?
      false
    end

  private

    # @return [Hash]
    def options
      Hash[Zaim::Configuration.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end
end
