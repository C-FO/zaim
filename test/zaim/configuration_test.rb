require 'test_helper'

describe Zaim::Configuration do
  before do
    @clean_room = Class.new

    class << @clean_room
      include Zaim::Configuration
    end
  end

  describe '#configure' do

    it 'returns an instance of the caller class' do
      @clean_room.configure {|config|}.must_be_instance_of Class
    end

    describe 'consumer_key' do
      it 'should be configurable' do
        @clean_room.configure do |config|
          config.consumer_key = '1'
        end

        @clean_room.consumer_key.must_equal '1'
      end
    end

    describe 'api_version' do
      it 'should be configurable' do
        @clean_room.configure do |config|
          config.api_version = '1'
        end

        @clean_room.api_version.must_equal '1'
      end
    end

    describe 'user_agent' do
      it 'should be configurable' do
        @clean_room.configure do |config|
          config.user_agent = '1'
        end

        @clean_room.user_agent.must_equal '1'
      end
    end

    describe 'consumer_secret' do
      it 'should be configurable' do
        @clean_room.configure do |config|
          config.consumer_secret = '1'
        end

        @clean_room.instance_variable_get('@consumer_secret').must_equal '1'
      end

      it 'should have not its getter' do
        @clean_room.wont_respond_to :consumer_secret
      end
    end

  end

  describe '#reset!' do
    before do
      @clean_room.configure do |config|
        config.consumer_key = '1'
        config.consumer_secret = '1'
        config.api_version = '1'
        config.user_agent = '1'
      end

      @clean_room.reset!
    end

    it 'resets consumer_key' do
      @clean_room.consumer_key.must_be_nil
    end

    it 'resets consumer_secret' do
      @clean_room.instance_variable_get('@consumer_secret').must_be_nil
    end

    it 'resets api_version' do
      @clean_room.api_version.must_equal Zaim::Default::API_VERSION
    end

    it 'resets user_agent' do
      @clean_room.user_agent.must_equal Zaim::Default::USER_AGENT
    end
  end

  describe '#credentials?' do
    it 'returns false' do
      @clean_room.credentials?.must_equal false
    end
  end

end