require 'zaim/configuration'
require 'zaim/version'

module Zaim
  module Default

    API_VERSION = 2 unless defined? Zaim::Default::API_VERSION
    USER_AGENT = "Zaim Ruby Gem #{Zaim::Version}".freeze unless defined? Zaim::Default::USER_AGENT

    class << self

      # @return [Hash]
      def options
        Hash[Zaim::Configuration.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def consumer_key
        ENV['ZAIM_CONSUMER_KEY']
      end

      # @return [String]
      def consumer_secret
        ENV['ZAIM_CONSUMER_SECRET']
      end

      # @return [Integer]
      def api_version
        API_VERSION
      end

      # @return [String]
      def user_agent
        USER_AGENT
      end

    end
  end
end