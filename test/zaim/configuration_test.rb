require 'test_helper.rb'

describe Zaim::Configuration do
  before do
    @clean_class = Class.new

    class << @clean_class
      include Zaim::Configuration
    end
  end

  describe '#configure' do

    it 'returns an instance of the caller class' do
      @clean_class.configure {|config|}.must_be_instance_of Class
    end

    describe 'consumer_key' do
      it 'should be configurable' do
        @clean_class.configure do |config|
          config.consumer_key = '1'
        end

        @clean_class.consumer_key.must_equal '1'
      end
    end

    describe 'api_version' do
      it 'should be configurable' do
        @clean_class.configure do |config|
          config.api_version = '1'
        end

        @clean_class.api_version.must_equal '1'
      end
    end

    describe 'user_agent' do
      it 'should be configurable' do
        @clean_class.configure do |config|
          config.user_agent = '1'
        end

        @clean_class.user_agent.must_equal '1'
      end
    end

    describe 'consumer_secret' do
      it 'should be configurable' do
        @clean_class.configure do |config|
          config.consumer_secret = '1'
        end

        @clean_class.instance_variable_get('@consumer_secret').must_equal '1'
      end

      it 'should have not its getter' do
        @clean_class.wont_respond_to :consumer_secret
      end
    end

  end

  describe '#reset!' do
    before do
      @clean_class.configure do |config|
        config.consumer_key = '1'
        config.consumer_secret = '1'
        config.api_version = '1'
        config.user_agent = '1'
      end

      @clean_class.reset!
    end

    it 'resets consumer_key' do
      @clean_class.consumer_key.must_be_nil
    end

    it 'resets consumer_secret' do
      @clean_class.instance_variable_get('@consumer_secret').must_be_nil
    end

    it 'resets api_version' do
      @clean_class.api_version.must_equal Zaim::Default::API_VERSION
    end

    it 'resets user_agent' do
      @clean_class.user_agent.must_equal Zaim::Default::USER_AGENT
    end
  end

  describe '#credentials?' do
    it 'returns false' do
      @clean_class.credentials?.must_equal false
    end
  end

end