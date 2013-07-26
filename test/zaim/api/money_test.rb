require 'test_helper'

describe Zaim::API::Money do
  before do
    @client = Zaim::Client.new
  end

  describe '#money_get' do

    describe 'with authorized_user' do
      before do
        stub_get('v2/home/money').to_return(body: fixture('money.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @money = @client.money_get
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('v2/home/money')
      end

      it 'returns an array of instances of Zaim::Money' do
        @money.count.must_equal @money.select {|a| a.is_a? Zaim::Money}.count
      end
    end

    describe 'without authorization' do
      before do
        stub_get('v2/home/money').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.money_get }.must_raise Zaim::Error::Unauthorized
      end
    end

  end

  describe '#money' do
    it 'is an alias of #money_get' do
      @client.method(:money).must_equal @client.method(:money_get)
    end
  end

  describe '#payment_post' do

    describe 'with authorized_user' do
      before do
        stub_post('v2/home/money/payment').to_return(body: fixture('money_response.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @response = @client.payment_post(1, 2, 300, '2013-01-01', {a: 4})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do        
        assert_request_requested a_post('v2/home/money/payment')
      end

      it 'returns an instance of Zaim::Money::Response' do
        @response.must_be_instance_of Zaim::Money::Response
      end
    end

    describe 'without authorization' do
      before do
        stub_post('v2/home/money/payment').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.payment_post(1, 2, 300, '2013-01-01', {a: 4}) }.must_raise Zaim::Error::Unauthorized
      end
    end

  end

  describe '#create_payment' do
    it 'is an alias of #payment_post' do
      @client.method(:create_payment).must_equal @client.method(:payment_post)
    end
  end

  describe '#income_post' do

    describe 'with authorized_user' do
      before do
        stub_post('v2/home/money/income').to_return(body: fixture('money_response.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @response = @client.income_post(1, 200, '2013-01-01', {a: 4})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('v2/home/money/income')
      end

      it 'returns an instance of Zaim::Money::Response' do
        @response.must_be_instance_of Zaim::Money::Response
      end
    end

    describe 'without authorization' do
      before do
        stub_post('v2/home/money/income').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.income_post(1, 200, '2013-01-01', {a: 4}) }.must_raise Zaim::Error::Unauthorized
      end
    end

  end

  describe '#create_income' do
    it 'is an alias of #income_post' do
      @client.method(:create_income).must_equal @client.method(:income_post)
    end
  end

  describe '#transfer_post' do

    describe 'with authorized_user' do
      before do
        stub_post('v2/home/money/transfer').to_return(body: fixture('money_response.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @response = @client.transfer_post(100, '2013-01-01', 3, 4, {a: 4})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('v2/home/money/transfer')
      end

      it 'returns an instance of Zaim::Money::Response' do
        @response.must_be_instance_of Zaim::Money::Response
      end
    end

    describe 'without authorization' do
      before do
        stub_post('v2/home/money/transfer').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.transfer_post(100, '2013-01-01', 3, 4, {a: 4}) }.must_raise Zaim::Error::Unauthorized
      end
    end

  end

  describe '#create_transfer' do
    it 'is an alias of #transfer_post' do
      @client.method(:create_transfer).must_equal @client.method(:transfer_post)
    end
  end

  describe '#money_put' do

    describe 'with authorized_user' do
      before do
        stub_put('v2/home/money/payment/1').to_return(body: fixture('money_response.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @response = @client.money_put(:payment, 1, 200, '2013-01-01', {a: 3})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do        
        assert_request_requested a_put('v2/home/money/payment/1')
      end

      it 'returns an instance of Zaim::Money::Response' do
        @response.must_be_instance_of Zaim::Money::Response
      end
    end

    describe 'without authorization' do
      before do
        stub_put('v2/home/money/payment/1').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.money_put(:payment, 1, 200, '2013-01-01', {a: 3}) }.must_raise Zaim::Error::Unauthorized
      end
    end

    describe 'with invalid money type' do
      it 'raises RuntimeError' do
        -> { @client.money_put(:zaim, 1, 200, '2013-01-01', {a: 3}) }.must_raise RuntimeError
      end
    end

  end

  describe '#update_payment' do
    it 'calls money_put with the correct argument' do
      mock = MiniTest::Mock.new.expect(:call, true, [:payment, 1, 2, 3, {a: 4}])

      @client.stub(:money_put, mock) do
        @client.update_payment(1, 2, 3, {a: 4})
      end

      mock.verify.must_equal true
    end
  end

  describe '#update_income' do
    it 'calls money_put with the correct argument' do
      mock = MiniTest::Mock.new.expect(:call, true, [:income, 1, 2, 3, {a: 4}])

      @client.stub(:money_put, mock) do
        @client.update_income(1, 2, 3, {a: 4})
      end

      mock.verify.must_equal true
    end
  end

  describe '#update_transfer' do
    it 'calls money_put with the correct argument' do
      mock = MiniTest::Mock.new.expect(:call, true, [:transfer, 1, 2, 3, {a: 4}])

      @client.stub(:money_put, mock) do
        @client.update_transfer(1, 2, 3, {a: 4})
      end

      mock.verify.must_equal true
    end
  end

  describe '#money_delete' do

    describe 'with authorized_user' do
      before do
        stub_delete('v2/home/money/payment/1').to_return(body: fixture('money_response.json'), headers: {content_type: 'application/json; charset=utf-8'})
        @response = @client.money_delete(:payment, 1)
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do        
        assert_request_requested a_delete('v2/home/money/payment/1')
      end

      it 'returns an instance of Zaim::Money::Response' do
        @response.must_be_instance_of Zaim::Money::Response
      end
    end

    describe 'without authorization' do
      before do
        stub_delete('v2/home/money/payment/1').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { @client.money_delete(:payment, 1) }.must_raise Zaim::Error::Unauthorized
      end
    end

    describe 'with invalid money type' do
      it 'raises RuntimeError' do
        -> { @client.money_delete(:zaim, 1) }.must_raise RuntimeError
      end
    end

  end

  describe '#delete_payment' do
    it 'calls money_delete with the correct argument' do
      mock = MiniTest::Mock.new.expect(:call, true, [:payment, 1])

      @client.stub(:money_delete, mock) do
        @client.delete_payment(1)
      end

      mock.verify.must_equal true
    end
  end

  describe '#delete_income' do
    it 'calls money_delete with the correct argument' do
      mock = MiniTest::Mock.new.expect(:call, true, [:income, 1])

      @client.stub(:money_delete, mock) do
        @client.delete_income(1)
      end

      mock.verify.must_equal true
    end
  end

  describe '#delete_transfer' do
    it 'calls money_delete with the correct argument' do
      mock = MiniTest::Mock.new.expect(:call, true, [:transfer, 1])

      @client.stub(:money_delete, mock) do
        @client.delete_transfer(1)
      end

      mock.verify.must_equal true
    end
  end

end