require 'test_helper.rb'

describe Zaim::Money do
  before do
    @money = Zaim::Money.new(id: 1, date: '2013-01-01', created: '2013-01-01 00:00:00')
  end

  describe '.superclass' do
    it 'is Zaim::Identity' do
      Zaim::Money.superclass.must_equal Zaim::Identity
    end
  end

  describe '#date' do
    it 'returns an instance of Time' do
      @money.date.must_equal Date.new(2013, 1, 1)
    end
  end

  describe '#created' do
    it 'returns an instance of Time' do
      @money.created.must_equal Time.new(2013, 1, 1)
    end
  end

end

describe Zaim::Money::Response do
  before do
    @response = Zaim::Money::Response.new(
      user: {id: 1},
      money: {id: 1},
      stamps: {
        kiriban: {},
        repeat: {},
        first: {}
      }
    )
  end

  describe '#user' do
    it 'returns an instance of Zaim::User' do
      @response.user.must_be_instance_of Zaim::User
    end
  end

  describe '#money' do
    it 'returns an instance of Zaim::Money' do
      @response.money.must_be_instance_of Zaim::Money
    end
  end

  describe '#kiriban_stamp' do
    it 'returns an instance of Zaim::Stamp' do
      @response.kiriban_stamp.must_be_instance_of Zaim::Stamp
    end
  end

  describe '#repeat_stamp' do
    it 'returns an instance of Zaim::Stamp' do
      @response.repeat_stamp.must_be_instance_of Zaim::Stamp
    end
  end

  describe '#first_stamp' do
    it 'returns an instance of Zaim::Stamp' do
      @response.first_stamp.must_be_instance_of Zaim::Stamp
    end
  end

end