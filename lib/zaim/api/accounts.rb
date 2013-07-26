require 'zaim/api/utils'
require 'zaim/account'

module Zaim
  module API
    module Accounts
      include Zaim::API::Utils

      # Returns the list of custom accounts if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#account_home_get
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Account}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of custom accounts if authentication was successful
      #   client.account_home_get
      def account_home_get(options={})
        objects_from_response(Zaim::Account, :get, '/home/account', :accounts, options)
      end
      alias accounts account_home_get

      # Returns the list of default accounts
      #
      # @see https://dev.zaim.net/home/api#account_get
      # @note Authentication Not Required
      # @return [Array] Array of {Zaim::Account}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default accounts
      #   Zaim.account_get
      def account_get(options={})
        objects_from_response(Zaim::Account, :get, '/account', :accounts, options)
      end
      alias default_accounts account_get

    end
  end
end
