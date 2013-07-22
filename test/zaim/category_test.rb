require 'test_helper'

describe Zaim::Category do
  before do
    @category = Zaim::Category.new(id: 1, modified: '2013-01-01 00:00:00')
  end

  describe '.superclass' do
    it 'is Zaim::Identity' do
      Zaim::Category.superclass.must_equal Zaim::Identity
    end
  end

  describe '#modified' do
    it 'returns an instance of Time' do
      @category.modified.must_equal Time.new(2013, 1, 1)
    end
  end

end
