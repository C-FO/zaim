require 'zaim/error'

module Zaim
  class Error
    # Raised when Zaim returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Zaim::Error

      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [Zaim::Error]
      def self.from_response(response={})
        new(parse_error(response[:body]), response[:response_headers])
      end

    private

      def self.parse_error(body)
        if body.nil?
          ''
        elsif body.is_a?(String)
          body
        elsif body.is_a?(Hash)
          if body[:error]
            body[:error]
          elsif body[:errors]
            first = Array(body[:errors]).first
            if first.is_a?(Hash)
              first[:message].chomp
            else
              first.chomp
            end
          end
        end
      end

    end
  end
end