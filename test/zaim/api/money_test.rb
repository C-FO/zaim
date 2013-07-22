require 'test_helper'

describe Zaim::API::Money do

  describe '#money_get' do
    before do
      stub_get('v2/home/money').to_return(body: fixture('money.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @money = Zaim::Client.new.money_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/home/money')
    end

    it 'returns an array of instances of Zaim::Money' do
      @money.count.must_equal @money.select {|a| a.is_a? Zaim::Money}.count
    end
  end

end