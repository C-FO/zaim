require 'zaim/api/utils'
require 'zaim/account'

module Zaim
  module API
    module Accounts
      include Zaim::API::Utils

      # Returns the list of custom accounts if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#account_home_get
      # @authentication Requires user context
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Account}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of custom accounts if authentication was successful
      #   Zaim.account_home_get
      def account_home_get(options={})
        objects_from_response(Zaim::Account, :get, '/home/account', :accounts, options)
      end

      # Returns the list of default accounts
      #
      # @see https://dev.zaim.net/home/api#account_get
      # @authentication Not Required
      # @return [Array] Array of {Zaim::Account}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default accounts
      #   Zaim.account_get
      def account_get(options={})
        objects_from_response(Zaim::Account, :get, '/account', :categories, options)
      end

    end
  end
end
