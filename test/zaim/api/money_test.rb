require 'test_helper.rb'

describe Zaim::API::Money do

  describe '#money_get' do
    before do
      stub_get('v2/home/money').to_return(body: fixture('money.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @client = Zaim::Client.new
    end

    it 'requests the correct resource' do
      @client.money_get
      assert_request_requested a_get('v2/home/money')
    end

    it 'returns an array of instances of Zaim::Money' do
      money = @client.money_get
      money.count.must_equal money.select {|a| a.is_a? Zaim::Money}.count
    end
  end

end