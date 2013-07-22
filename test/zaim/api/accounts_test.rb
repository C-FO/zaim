require 'test_helper.rb'

describe Zaim::API::Accounts do

  describe '#account_home_get' do
    before do
      stub_get('v2/home/account').to_return(body: fixture('account_home.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @accounts = Zaim::Client.new.account_home_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/home/account')
    end

    it 'returns an array of instances of Zaim::Account' do
      @accounts.count.must_equal @accounts.select {|a| a.is_a? Zaim::Account}.count
    end
  end

  describe '#account_get' do
    before do
      stub_get('v2/account').to_return(body: fixture('account.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @accounts = Zaim::Client.new.account_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/account')
    end

    it 'returns an array of instances of Zaim::Account' do
      @accounts.count.must_equal @accounts.select {|a| a.is_a? Zaim::Account}.count
    end
  end

end