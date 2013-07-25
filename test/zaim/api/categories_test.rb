require 'test_helper'

describe Zaim::API::Categories do
  before do
    @client = Zaim::Client.new
  end

  describe '#category_home_get' do

    describe 'with authorized user' do
      before do
        stub_get('v2/home/category').to_return(body: fixture('category_home.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @categories = @client.category_home_get
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('v2/home/category')
      end

      it 'returns an array of instances of Zaim::Category' do
        @categories.count.must_equal @categories.select {|a| a.is_a? Zaim::Category}.count
      end
    end

    describe 'without authorization' do
      before do
        stub_get('v2/home/category').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.category_home_get }.must_raise Zaim::Error::Unauthorized
      end
    end
  end

  describe '#categories' do
    it 'is the alias of #category_home_get' do
      @client.method(:categories).must_equal @client.method(:category_home_get)
    end
  end

  describe '#category_get' do
    before do
      stub_get('v2/category').to_return(body: fixture('category.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @categories = @client.category_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/category')
    end

    it 'returns an array of instances of Zaim::Category' do
      @categories.count.must_equal @categories.select {|a| a.is_a? Zaim::Category}.count
    end
  end

  describe '#default_categories' do
    it 'is the alias of #category_get' do
      @client.method(:default_categories).must_equal @client.method(:category_get)
    end
  end

end