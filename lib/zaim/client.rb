require 'zaim/api/accounts'
require 'zaim/api/categories'
require 'zaim/api/currencies'
require 'zaim/api/genres'
require 'zaim/api/money'
require 'zaim/api/users'
require 'zaim/configuration'
require 'zaim/request'

module Zaim
  class Client
    include Zaim::API::Accounts
    include Zaim::API::Categories
    include Zaim::API::Currencies
    include Zaim::API::Genres
    include Zaim::API::Money
    include Zaim::API::Users
    include Zaim::Configuration
    include Zaim::Request

    attr_accessor :oauth_token
    attr_writer :oauth_token_secret

    # Initializes a new Client object
    # 
    # @param options [Hash] A customizable set of options.
    # @option oauth_token [String]
    # @option oauth_token_secret [String]
    # @return [Zaim::Client]
    def initialize(options={})
      # Set global keys
      Zaim::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Zaim.instance_variable_get(:"@#{key}"))
      end
      # Set client keys
      oauth_token_keys.each do |key|
        instance_variable_set(:"@#{key}", options[key])
      end
      self
    end

    # @return [Boolean]
    def oauth_token?
      !!(@oauth_token && @oauth_token_secret)
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

  private

    def oauth_token_keys
      @oauth_token_keys ||= [
        :oauth_token,
        :oauth_token_secret
      ]
    end

    # @return [Hash]
    def credentials
      {
        consumer_key: @consumer_key,
        consumer_secret: @consumer_secret,
        token: @oauth_token,
        token_secret: @oauth_token_secret        
      }
    end

  end
end
