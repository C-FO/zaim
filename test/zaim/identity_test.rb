require 'test_helper'

describe Zaim::Identity do

  describe '.superclass' do
    it 'is Zaim::Base' do
      Zaim::Identity.superclass.must_equal Zaim::Base
    end
  end

  describe '#initialize' do
    it 'raises ArgumentError with no id' do
      -> { Zaim::Identity.new }.must_raise ArgumentError
    end
  end

  describe '#==' do
    it 'returns true when ids are the same' do
      identity1 = Zaim::Identity.new(id: 1, name: 'identity1')
      identity2 = Zaim::Identity.new(id: 1, name: 'identity2')
      identity1.must_equal identity2
    end

    it 'returns false when ids are different' do
      identity1 = Zaim::Identity.new(id: 1)
      identity2 = Zaim::Identity.new(id: 2)
      identity1.wont_equal identity2
    end

    it 'returns false when classes are different' do
      identity1 = Zaim::Identity.new(id: 1)
      identity2 = Zaim::Base.new(id: 1)
      identity1.wont_equal identity2
    end
  end

  describe '#id' do
    it 'returns id' do
      identity = Zaim::Identity.new(id: 1)
      identity.id.must_equal 1
    end
  end

end
