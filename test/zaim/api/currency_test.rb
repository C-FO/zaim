require 'test_helper'

describe Zaim::API::Currencies do
  before do
    @client = Zaim::Client.new
  end

  describe '#currency_get' do
    before do
      stub_get('v2/currency').to_return(body: fixture('currency.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @currencies = @client.currency_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/currency')
    end

    it 'returns an array of instances of Zaim::Currency' do
      @currencies.count.must_equal @currencies.select {|a| a.is_a? Zaim::Currency}.count
    end
  end

  describe '#currencies' do
    it 'is an alias of #currency_get' do
      @client.method(:currencies).must_equal @client.method(:currency_get)
    end
  end

end