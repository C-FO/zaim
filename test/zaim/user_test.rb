require 'test_helper'

describe Zaim::User do
  before do
    @user = Zaim::User.new(id: 1)
  end

  describe '.superclass' do
    it 'is Zaim::Identity' do
      Zaim::User.superclass.must_equal Zaim::Identity
    end
  end

  describe '.from_response' do
    it 'returns an instance of Zaim::User' do
      Zaim::User.from_response(body: {me: {id: 1}}).must_be_instance_of Zaim::User
    end
  end

end
