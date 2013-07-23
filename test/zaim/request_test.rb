require 'test_helper'
require 'faraday'

describe Zaim::Request do
  before do
    @clean_class = Class.new

    class << @clean_class
      include Zaim::Request
    end
  end

  describe '#get' do

    describe 'with success result' do
      before do
        stub_get('zaim/get').with(query: {a: '1'})
        @clean_class.get('zaim/get', {a: '1'})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('zaim/get').with(query: {a: '1'})
      end
    end

    describe 'with client error' do
      before do
        stub_get('zaim/error').to_raise Faraday::Error::ClientError
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::ClientError' do
        -> { @clean_class.get('zaim/error') }.must_raise Zaim::Error::ClientError
      end
    end

  end

  describe '#post' do

    describe 'with success result' do
      before do
        stub_post('zaim/post').with(body: {a: '1'})
        @clean_class.post('zaim/post', {a: '1'})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('zaim/post').with(body: {a: '1'})
      end
    end

    describe 'with client error' do
      before do
        stub_post('zaim/error').to_raise Faraday::Error::ClientError
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::ClientError' do
        -> { @clean_class.post('zaim/error') }.must_raise Zaim::Error::ClientError
      end
    end

  end


  describe '#put' do

    describe 'with success result' do
      before do
        stub_put('zaim/put').with(body: {a: '1'})
      end

      after { WebMock.reset! }

      it 'with custom path and params' do
        @clean_class.put('zaim/put', {a: '1'})
        assert_request_requested a_put('zaim/put').with(body: {a: '1'})
      end
    end

    describe 'with client error' do
      before do
        stub_put('zaim/error').to_raise Faraday::Error::ClientError
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::ClientError' do
        -> { @clean_class.put('zaim/error') }.must_raise Zaim::Error::ClientError
      end
    end

  end

  describe '#delete' do

    describe 'with success result' do
      before do
        stub_delete('zaim/delete').with(query: {a: '1'})
        @clean_class.delete('zaim/delete', {a: '1'})
      end

      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_delete('zaim/delete').with(query: {a: '1'})
      end
    end

    describe 'with client error' do
      before do
        stub_delete('zaim/error').to_raise Faraday::Error::ClientError
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::ClientError' do
        -> { @clean_class.delete('zaim/error') }.must_raise Zaim::Error::ClientError
      end
    end

  end

end