require 'test_helper'

describe Zaim do

  after do
    Zaim.reset!
  end

  describe '.client' do
    it 'returns an instance of Zaim::Client' do
      Zaim.client.must_be_instance_of Zaim::Client
    end
  end

  describe '.respond_to?' do
    it 'delegates to Zaim::Client' do
      Zaim.respond_to?(:user_verify).must_equal true
    end
  end

  describe '.method_missing' do
    it 'delegates to Zaim::Client' do
      Zaim.oauth_token?.must_equal false
    end

    it 'returns NoMethodError with undefined method' do
      -> { Zaim.undefined }.must_raise NoMethodError
    end
  end

end