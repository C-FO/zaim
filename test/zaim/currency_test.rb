require 'test_helper'

describe Zaim::Currency do

  describe '.superclass' do
    it 'is Zaim::Base' do
      Zaim::Currency.superclass.must_equal Zaim::Base
    end
  end

end
