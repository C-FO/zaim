require 'test_helper'

describe Zaim::API::Users do

  describe '#user_verify' do
    before do
      stub_get('v2/home/user/verify').to_return(body: fixture('user_verify.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @user = Zaim::Client.new.user_verify
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/home/user/verify')
    end

    it 'returns an instance of Zaim::User' do
      @user.must_be_instance_of Zaim::User
    end
  end

end