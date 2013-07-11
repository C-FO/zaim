require 'zaim/api/utils'
require 'zaim/category'

module Zaim
  module API
    module Categories
      include Zaim::API::Utils

      # Returns the list of custom categories if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#category_home_get
      # @authentication Requires user context
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Category}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of custom categories if authentication was successful
      #   Zaim.category_home_get
      def category_home_get(options={})
        objects_from_response(Zaim::Category, :get, '/home/category', :categories, options)
      end

      # Returns the list of default categories
      #
      # @see https://dev.zaim.net/home/api#category_get
      # @authentication Not Required
      # @return [Array] Array of {Zaim::Category}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default categories
      #   Zaim.category_get
      def category_get(options={})
        objects_from_response(Zaim::Category, :get, '/category', :categories, options)
      end      

    end
  end
end
