require 'test_helper'

describe Zaim::Error::ClientError do
  
  describe '.from_response' do

    describe 'with nil body' do
      before do
        @body = nil
      end

      it 'returns empty string' do
        Zaim::Error::ClientError.from_response({body: @body}).message.must_equal ''
      end
    end

    describe 'with string body' do
      before do
        @body = 'abc'
      end

      it 'returns string value' do
        Zaim::Error::ClientError.from_response({body: @body}).message.must_equal 'abc'
      end
    end

    describe "with hash key 'error' body" do
      before do
        @body = {error: '123'}
      end

      it 'returns body[:error] value' do
        Zaim::Error::ClientError.from_response({body: @body}).message.must_equal '123'
      end
    end

    describe "with hash key 'errors' body" do
      it 'returns body[:errors][:message]' do
        body = {errors: [{message: 'X'}, {message: 'Y'}, {message: 'Z'}]}
        Zaim::Error::ClientError.from_response({body: body}).message.must_equal 'X'
      end

      it 'returns the first element of an array' do
        body = {errors: ['A', 'B', 'C']}
        Zaim::Error::ClientError.from_response({body: body}).message.must_equal 'A'
      end
    end

  end
end