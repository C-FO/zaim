require 'zaim/core_ext/hash'

module Zaim
  module API
    module Utils

    private

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def objects_from_response(klass, request_method, path, response_key, options={})
        response = send(request_method.to_sym, path_with_version(path), options)[:body]
        objects_from_array(klass, response[response_key.to_s])
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def objects_from_array(klass, array)
        array.map do |element|
          klass.new(element.deep_symbolize_keys)
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path_with_version(path), options)
        klass.from_response(response.deep_symbolize_keys)
      end

      def path_with_version(path)
        '/v' + @api_version.to_s + path
      end

      def parse_date(date)
        if date.is_a? String
          Date.parse(date).strftime('%Y-%m-%d')
        elsif date.is_a? Date
          date.strftime('%Y-%m-%d')
        else
          raise
        end
      rescue => ex
        raise ArgumentError.new 'invalid date'
      end

    end
  end
end
