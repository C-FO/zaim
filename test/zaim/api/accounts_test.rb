require 'test_helper'

describe Zaim::API::Accounts do
  before do
    @client = Zaim::Client.new
  end

  describe '#account_home_get' do

    describe 'with authorized user' do
      before do
        stub_get('v2/home/account').to_return(body: fixture('account_home.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @accounts = @client.account_home_get
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('v2/home/account')
      end

      it 'returns an array of instances of Zaim::Account' do
        @accounts.count.must_equal @accounts.select {|a| a.is_a? Zaim::Account}.count
      end
    end

    describe 'without authorization' do
      before do
        stub_get('v2/home/account').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.account_home_get }.must_raise Zaim::Error::Unauthorized
      end
    end
  end

  describe '#accounts' do
    it 'is an alias of #account_home_get' do
      @client.method(:accounts).must_equal @client.method(:account_home_get)
    end
  end

  describe '#account_get' do
    before do
      stub_get('v2/account').to_return(body: fixture('account.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @accounts = @client.account_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/account')
    end

    it 'returns an array of instances of Zaim::Account' do
      @accounts.count.must_equal @accounts.select {|a| a.is_a? Zaim::Account}.count
    end
  end

  describe '#default_accounts' do
    it 'is an alias of #account_get' do
      @client.method(:default_accounts).must_equal @client.method(:account_get)
    end
  end

end