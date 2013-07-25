require 'test_helper'

describe Zaim::API::Utils do
  before do
    class CleanRoomForUtilsTest < OpenStruct
      def self.from_response(response); self.new; end
    end unless defined? CleanRoomForUtilsTest

    @clean_room = Class.new

    class << @clean_room
      include Zaim::API::Utils

      def stub_get(path, options={})
        {body: {}}
      end

      def stub_get_for_array(path, options={})
        {body: {'key' => []}}
      end
    end
  end

  describe '#objects_from_response' do
    it 'returns an array of instances of passed klass' do
      response = @clean_room.send(:objects_from_response, CleanRoomForUtilsTest, :stub_get_for_array, '/zaim', :key)
      response.size.must_equal response.select {|v| v.is_a? CleanRoomForUtilsTest}.size
    end
  end

  describe '#objects_from_array' do
    it 'returns an array of instances of passed klass' do
      response = @clean_room.send(:objects_from_array, CleanRoomForUtilsTest, [{a: 1}, {b: 2}])
      response.size.must_equal response.select {|v| v.is_a? CleanRoomForUtilsTest}.size
    end
  end

  describe '#object_from_response' do
    it 'returns an instance of passed klass' do
      @clean_room.send(:object_from_response, CleanRoomForUtilsTest, :stub_get, '/zaim').must_be_instance_of CleanRoomForUtilsTest
    end
  end

  describe '#path_with_version' do
    it 'returns a path string with the correct version' do
      @clean_room.instance_eval { @api_version = 1 }
      @clean_room.send(:path_with_version, '/zaim').must_equal '/v1/zaim'
    end
  end

  describe '#parse_date' do

    describe 'with a string argument' do
      it 'returns the correct date string' do
        @clean_room.send(:parse_date, '2013/01/01').must_equal '2013-01-01'
      end
    end

    describe 'with a date argument' do
      it 'returns the correct date string' do
        @clean_room.send(:parse_date, Date.new(2013, 1, 1)).must_equal '2013-01-01'
      end
    end

    describe 'with an invalid argument' do
      it 'raise ArgumentError' do
        -> { @clean_room.send(:parse_date, 1) }.must_raise ArgumentError
      end
    end

  end

end