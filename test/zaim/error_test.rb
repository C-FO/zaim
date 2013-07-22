require 'test_helper.rb'

describe Zaim::Error do

  describe '.descendants' do
    it 'returns an array of Zaim::Error::*' do
      descendants = Zaim::Error.descendants
      descendants.count.must_equal descendants.select{|d| d < Zaim::Error}.count
    end    
  end

  describe '#initialize' do

    describe 'wraps another error class' do
      before do
        class TestError < RuntimeError; end unless defined? TestError

        @exception = begin
          raise TestError.new 'oh...' rescue raise Zaim::Error
        rescue Zaim::Error => ex
          ex
        end
      end

      it 'error message' do
        @exception.message.must_equal 'oh...'
      end

      it 'wrapped exception' do
        @exception.wrapped_exception.class.must_equal TestError
      end
    end
  end

end