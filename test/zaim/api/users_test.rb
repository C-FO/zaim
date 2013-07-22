require 'test_helper.rb'

describe Zaim::API::Users do

  describe '#verify' do
    before do
      stub_get('v2/home/user/verify').to_return(body: fixture('verify.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @client = Zaim::Client.new
    end

    it 'requests the correct resource' do
      @client.verify
      assert_request_requested a_get('v2/home/user/verify')
    end

    it 'returns an instance of Zaim::User' do
      @client.verify.must_be_instance_of Zaim::User
    end
  end

end