require 'zaim/cursor'
require 'zaim/core_ext/hash'

module Zaim
  module API
    module Utils

      DEFAULT_CURSOR = -1

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

      # @param collection_name [Symbol]
      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param method_name [Symbol]
      # @return [Zaim::Cursor]
      def cursor_from_response(collection_name, klass, request_method, path, options, method_name)
        merge_default_cursor!(options)
        response = send(request_method.to_sym, path_with_version(path), options)
        Zaim::Cursor.from_response(response.deep_symbolize_keys, collection_name.to_sym, klass, self, method_name, options)
      end

      def handle_forbidden_error(klass, error)
        if error.message == klass::MESSAGE
          raise klass.new
        else
          raise error
        end
      end

      # @return [Integer]
      def merge_default_cursor!(options)
        options[:cursor] = DEFAULT_CURSOR unless options[:cursor]
      end

      def user_name
        @user_name ||= verify.name
      end

      def path_with_version(path)
        '/v' + @api_version.to_s + path
      end

    end
  end
end
