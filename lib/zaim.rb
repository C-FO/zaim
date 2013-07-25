require 'zaim/account'
require 'zaim/category'
require 'zaim/client'
require 'zaim/configuration'
require 'zaim/currency'
require 'zaim/default'
require 'zaim/genre'
require 'zaim/money'
require 'zaim/user'

module Zaim
  class << self
    include Zaim::Configuration

    # Delegate to a Zaim::Client
    #
    # @return [Zaim::Client]
    def client
      @client = Zaim::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end

    def respond_to?(method, include_private=false)
      client.respond_to?(method, include_private)
    end

  private

    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

  end
end

Zaim.reset!
