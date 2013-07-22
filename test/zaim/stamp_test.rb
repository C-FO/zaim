require 'test_helper.rb'

describe Zaim::Stamp do

  describe '.superclass' do
    it 'is Zaim::Base' do
      Zaim::Stamp.superclass.must_equal Zaim::Base
    end
  end

end
