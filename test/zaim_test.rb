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
      Zaim.respond_to?(:verify).must_equal true
    end
  end

end