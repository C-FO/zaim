require 'zaim/api/utils'
require 'zaim/user'

module Zaim
  module API
    module Users
      include Zaim::API::Utils

      # Returns the requesting user if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#user_verify
      # @authentication Requires user context
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::User] The authenticated user.
      # @param options [Hash] A customizable set of options.
      # @example Return the requesting user if authentication was successful
      #   Zaim.verify
      def verify(options={})
        object_from_response(Zaim::User, :get, '/home/user/verify', options)
      end
      alias current_user verify

    end
  end
end
