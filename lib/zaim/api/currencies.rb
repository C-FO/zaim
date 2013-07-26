require 'zaim/api/utils'
require 'zaim/currency'

module Zaim
  module API
    module Currencies
      include Zaim::API::Utils

      # Returns the list of default currencies
      #
      # @see https://dev.zaim.net/home/api#currency_get
      # @note Authentication Not Required
      # @return [Array] Array of {Zaim::Currency}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default currencies
      #   Zaim.currency_get
      def currency_get(options={})
        objects_from_response(Zaim::Currency, :get, '/currency', :currencies, options)
      end
      alias currencies currency_get

    end
  end
end
