require 'test_helper.rb'

describe Zaim::Default do

  describe '.options' do
    it 'returns a hash with the same keys as Zaim::Configuration' do
      Zaim::Default.options.keys.must_equal Zaim::Configuration.keys
    end
  end

  describe '.consumer_key' do
    after do
      ENV.delete 'ZAIM_CONSUMER_KEY'
    end

    it 'returns nil when ENV is not set' do
      Zaim::Default.consumer_key.must_be_nil
    end

    it 'returns the ENV value' do
      ENV['ZAIM_CONSUMER_KEY'] = '1'
      Zaim::Default.consumer_key.must_equal '1'
    end
  end

  describe '.consumer_secret' do
    after do
      ENV.delete 'ZAIM_CONSUMER_SECRET'
    end

    it 'returns nil when ENV is not set' do
      Zaim::Default.consumer_secret.must_be_nil
    end

    it 'returns the ENV value' do
      ENV['ZAIM_CONSUMER_SECRET'] = '1'
      Zaim::Default.consumer_secret.must_equal '1'
    end
  end

  describe '.api_version' do
    it 'returns ::API_VERSION' do
      Zaim::Default.api_version.must_equal Zaim::Default::API_VERSION
    end
  end

  describe '.user_agent' do
    it 'returns ::USER_AGENT' do
      Zaim::Default.user_agent.must_equal Zaim::Default::USER_AGENT
    end
  end

end