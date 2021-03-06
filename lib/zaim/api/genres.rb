require 'zaim/api/utils'
require 'zaim/genre'

module Zaim
  module API
    module Genres
      include Zaim::API::Utils

      # Returns the list of custom genres if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#genre_home_get
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Genre}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of custom genres if authentication was successful
      #   client.genre_home_get
      def genre_home_get(options={})
        objects_from_response(Zaim::Genre, :get, '/home/genre', :genres, options)
      end
      alias genres genre_home_get

      # Returns the list of default genres
      #
      # @see https://dev.zaim.net/home/api#genre_get
      # @note Authentication Not Required
      # @return [Array] Array of {Zaim::Genre}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default genres
      #   Zaim.genre_get
      def genre_get(options={})
        objects_from_response(Zaim::Genre, :get, '/genre', :genres, options)
      end
      alias default_genres genre_get

    end
  end
end
