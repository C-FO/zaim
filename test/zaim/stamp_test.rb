require 'test_helper'

describe Zaim::Stamp do

  describe '.superclass' do
    it 'is Zaim::Base' do
      Zaim::Stamp.superclass.must_equal Zaim::Base
    end
  end

end
