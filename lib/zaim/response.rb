require 'faraday'
require 'zaim/error/bad_gateway'
require 'zaim/error/bad_request'
require 'zaim/error/forbidden'
require 'zaim/error/gateway_timeout'
require 'zaim/error/internal_server_error'
require 'zaim/error/not_acceptable'
require 'zaim/error/not_found'
require 'zaim/error/service_unavailable'
require 'zaim/error/unauthorized'

module Zaim
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        status_code = env[:status].to_i
        error_class = @klass.errors[status_code]
        raise error_class.from_response(env) if error_class
      end

      def initialize(app, klass)
        @klass = klass
        super(app)
      end

    end
  end
end
