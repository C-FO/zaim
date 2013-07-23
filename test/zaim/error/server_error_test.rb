require 'test_helper'

describe Zaim::Error::ServerError do

  describe '#initialize' do

    describe 'with message' do
      it 'returns an error with input message' do
        Zaim::Error::ServerError.new('abc').message.must_equal 'abc'
      end
    end

    describe 'without message' do
      it 'returns an error with default message' do
        Zaim::Error::ServerError.new.message.must_equal Zaim::Error::ServerError::MESSAGE
      end
    end

  end

end