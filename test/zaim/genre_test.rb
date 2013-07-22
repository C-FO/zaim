require 'test_helper.rb'

describe Zaim::Genre do
  before do
    @genre = Zaim::Genre.new(id: 1, modified: '2013-01-01 00:00:00')
  end

  describe '.superclass' do
    it 'is Zaim::Identity' do
      Zaim::Genre.superclass.must_equal Zaim::Identity
    end
  end

  describe '#modified' do
    it 'returns an instance of Time' do
      @genre.modified.must_equal Time.new(2013, 1, 1)
    end
  end

end
