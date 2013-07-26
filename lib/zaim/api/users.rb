require 'zaim/api/utils'
require 'zaim/user'

module Zaim
  module API
    module Users
      include Zaim::API::Utils

      # Returns the requesting user if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#user_verify
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::User] The authenticated user.
      # @param options [Hash] A customizable set of options.
      # @example Return the requesting user if authentication was successful
      #   client.user_verify
      def user_verify(options={})
        object_from_response(Zaim::User, :get, '/home/user/verify', options)
      end
      alias current_user user_verify

    end
  end
end
