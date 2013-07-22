require 'test_helper.rb'

describe Zaim::Account do
  before do
    @account = Zaim::Account.new(id: 1, modified: '2013-01-01 00:00:00')
  end

  describe '.superclass' do
    it 'is Zaim::Identity' do
      Zaim::Account.superclass.must_equal Zaim::Identity
    end
  end

  describe '#modified' do
    it 'returns an instance of Time' do
      @account.modified.must_equal Time.new(2013, 1, 1)
    end
  end

end
