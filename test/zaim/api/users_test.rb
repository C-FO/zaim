require 'test_helper'

describe Zaim::API::Users do
  before do
    @client = Zaim::Client.new
  end

  describe '#user_verify' do
    before do
      stub_get('v2/home/user/verify').to_return(body: fixture('user_verify.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @user = @client.user_verify
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/home/user/verify')
    end

    it 'returns an instance of Zaim::User' do
      @user.must_be_instance_of Zaim::User
    end
  end

  describe '#current_user' do
    it 'is the alias of #user_verify' do
      @client.method(:current_user).must_equal @client.method(:user_verify)
    end
  end

end