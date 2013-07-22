require 'zaim/api/utils'
require 'zaim/money'

require 'date'

module Zaim
  module API
    module Money
      include Zaim::API::Utils

      # Returns the list of input money data if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#money_get
      # @authentication Requires user context
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Money}.
      # @param options [Hash] A customizable set of options.
      # @example Return the list of input money data if authentication was successful
      #   Zaim.money_get
      def money_get(options={})
        objects_from_response(Zaim::Money, :get, '/home/money', :money, options)
      end

      ## TODO: POST methods WIP

      # Input the authenticating user's payment data
      #
      # @see https://dev.zaim.net/home/api#payment_post
      # @authentication Requires user context
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::Money::Response] The reward stamps and the requested user's info.
      # @param category_id [Integer] The ID of the payment's category.
      # @param genre_id [Integer] The ID of the payment's genre.
      # @param amount [Integer] The payment amount.
      # @param date [Date, Time, String] The date of the payment. Past/future 5 years is valid.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :from_account_id The ID of the account which the payment is charged from
      # @option options [String] :comment The comment for the payment, up to 100 characters.
      # @option options [String] :name The name of the product charged for the payment, up to 100 characters.
      # @option options [String] :place The place where the payment is charged, up to 100 characters.
      # @example Update the authenticating user's status
      #   Zaim.payment_post()
      # def payment_post(category_id, genre_id, amount, date, options={})
      #   date = Date.parse(date) if date.is_a? String

      #   post_options = options.merge(
      #     category_id: category_id,
      #     genre_id: genre_id,
      #     amount: amount,
      #     date: date.strftime('%Y-%m-%d')
      #   )
      #   object_from_response(Zaim::Money::Response, :post, '/home/money/payment', post_options)
      # end
    end
  end
end
