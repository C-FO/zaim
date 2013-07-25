require 'faraday'
require 'faraday_middleware'
require 'zaim/configuration'
require 'zaim/response'
require 'zaim/error/client_error'
require 'zaim/error/decode_error'

module Zaim
  module Request

    def get(path, params={})
      request(:get, path, params)
    end

    def post(path, params={})
      request(:post, path, params)
    end

    def put(path, params={})
      request(:put, path, params)
    end

    def delete(path, params={})
      request(:delete, path, params)
    end

  private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      return @connection if @connection

      @connection = Faraday.new(Zaim::Configuration::ENDPOINT) do |conn|
        conn.request :oauth, credentials if respond_to?(:credentials?) && credentials?
        conn.request :url_encoded
        conn.request :json
        conn.use Zaim::Response::RaiseError, Zaim::Error::ClientError
        conn.response :json, :content_type => /\bjson$/
        conn.use Zaim::Response::RaiseError, Zaim::Error::ServerError
        conn.adapter Faraday.default_adapter
      end
    end

    def request(method, path, params={})
      connection.send(method.to_sym, path, params).env
    rescue Faraday::Error::ClientError then raise Zaim::Error::ClientError
    end

  end
end
