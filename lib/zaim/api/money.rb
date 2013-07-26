require 'zaim/api/utils'
require 'zaim/money'

module Zaim
  module API
    module Money
      include Zaim::API::Utils

      # Returns the list of input data if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#money_get
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Money}.
      # @param options [Hash] A customizable set of options.
      # @example Return the list of input money data if authentication was successful.
      #   client.money_get
      def money_get(options={})
        objects_from_response(Zaim::Money, :get, '/home/money', :money, options)
      end
      alias money money_get

      # Input payment data
      #
      # @see https://dev.zaim.net/home/api#payment_post
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::Money::Response] The reward stamps and the requested user's info.
      # @param category_id [Integer] The ID of the payment's category.
      # @param genre_id [Integer] The ID of the payment's genre.
      # @param amount [Integer] The payment amount.
      # @param date [Date, Time, String] The date of the payment. Past/future 5 years is valid.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :from_account_id The ID of the account which the payment is charged from.
      # @option options [String] :comment The comment for the payment, up to 100 characters.
      # @option options [String] :name The name of the product charged for the payment, up to 100 characters.
      # @option options [String] :place The place where the payment is charged, up to 100 characters.
      # @example
      #   client.payment_post(1, 2, 300, '2013-01-01', {comment: 'memo'})
      def payment_post(category_id, genre_id, amount, date, options={})
        post_options = options.merge(
          category_id: category_id,
          genre_id: genre_id,
          amount: amount,
          date: parse_date(date)
        )
        object_from_response(Zaim::Money::Response, :post, '/home/money/payment', post_options)
      end
      alias create_payment payment_post

      # Input income data
      #
      # @see https://dev.zaim.net/home/api#payment_post
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::Money::Response] The reward stamps and the requested user's info.
      # @param category_id [Integer] The ID of the income's category.
      # @param amount [Integer] The income amount.
      # @param date [Date, Time, String] The date of the income. Past/future 5 years is valid.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :to_account_id The ID of the account which the income is payed into.
      # @option options [String] :comment The comment for the income, up to 100 characters.
      # @example
      #   client.income_post(1, 200, '2013-01-01', {comment: 'memo'})
      def income_post(category_id, amount, date, options={})
        post_options = options.merge(
          category_id: category_id,
          amount: amount,
          date: parse_date(date)
        )
        object_from_response(Zaim::Money::Response, :post, '/home/money/income', post_options)
      end
      alias create_income income_post

      # Input transfer data
      #
      # @see https://dev.zaim.net/home/api#transfer_post
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::Money::Response] The reward stamps and the requested user's info.
      # @param amount [Integer] The transfer amount.
      # @param date [Date, Time, String] The date of the transfer. Past/future 5 years is valid.
      # @param from_account_id [Integer] The ID of the account which the transfer is charged from.
      # @param to_account_id [Integer] The ID of the account which the transfer is payed into.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :comment The comment for the transfer, up to 100 characters.
      # @example
      #   client.transfer_post(100, '2013-01-01', 2, 3, {comment: 'memo'})
      def transfer_post(amount, date, from_account_id, to_account_id, options={})
        post_options = options.merge(
          amount: amount,
          date: parse_date(date),
          from_account_id: from_account_id,
          to_account_id: to_account_id
        )
        object_from_response(Zaim::Money::Response, :post, '/home/money/transfer', post_options)
      end
      alias create_transfer transfer_post

      # Update money data
      #
      # @see https://dev.zaim.net/home/api#money_put
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::Money::Response] The reward stamps and the requested user's info.
      # @param type [Symbol, String]
      # @param id [Integer]
      # @param amount [Integer] The money amount.
      # @param date [Date, Time, String] The date of the money. Past/future 5 years is valid.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :from_account_id The ID of the account which the money is charged from.
      # @option options [Integer] :to_account_id The ID of the account which the money is charged from.
      # @option options [Integer] :genre_id The ID of the money's genre.
      # @option options [Integer] :category_id The ID of the money's category.
      # @option options [String] :comment The comment for the money, up to 100 characters.
      # @example
      #   client.money_put(:income, 1, 100, '2013-01-01', {comment: 'memo'})
      def money_put(type, id, amount, date, options={})
        raise "invalid type: #{type}" unless [:payment, :income, :transfer].include?(type.to_sym)

        put_options = options.merge(
          amount: amount,
          date: parse_date(date)
        )
        object_from_response(Zaim::Money::Response, :put, "/home/money/#{type}/#{id}", put_options)
      end

      def update_payment(id, amount, date, options={})
        money_put(:payment, id, amount, date, options)
      end

      def update_income(id, amount, date, options={})
        money_put(:income, id, amount, date, options)
      end

      def update_transfer(id, amount, date, options={})
        money_put(:transfer, id, amount, date, options)
      end

      # Delete money data
      #
      # @see https://dev.zaim.net/home/api#money_delete
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Zaim::Money::Response] The reward stamps and the requested user's info.
      # @param type [Symbol, String]
      # @param id [Integer]
      # @example
      #   client.money_delete(:payment, 1)
      def money_delete(type, id)
        raise "invalid type: #{type}" unless [:payment, :income, :transfer].include?(type.to_sym)

        object_from_response(Zaim::Money::Response, :delete, "/home/money/#{type}/#{id}")
      end      

      def delete_payment(id)
        money_delete(:payment, id)
      end

      def delete_income(id)
        money_delete(:income, id)
      end

      def delete_transfer(id)
        money_delete(:transfer, id)
      end

    end
  end
end
