require 'test_helper.rb'

describe Zaim::API::Currencies do

  describe '#currency_get' do
    before do
      stub_get('v2/currency').to_return(body: fixture('currency.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @client = Zaim::Client.new
    end

    it 'requests the correct resource' do
      @client.currency_get
      assert_request_requested a_get('v2/currency')
    end

    it 'returns an array of instances of Zaim::Currency' do
      currencies = @client.currency_get
      currencies.count.must_equal currencies.select {|a| a.is_a? Zaim::Currency}.count
    end
  end

end