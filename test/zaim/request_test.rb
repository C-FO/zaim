require 'test_helper'

describe Zaim::Request do
  before do
    @clean_class = Class.new

    class << @clean_class
      include Zaim::Request
    end
  end

  describe '#get' do
    before do
      stub_get('zaim/get').with(query: {a: '1'})
    end

    it 'with custom path and params' do
      @clean_class.get('zaim/get', {a: '1'})
      assert_request_requested a_get('zaim/get').with(query: {a: '1'})
    end
  end

  describe '#put' do
    before do
      stub_put('zaim/put').with(body: {a: '1'})
    end

    it 'with custom path and params' do
      @clean_class.put('zaim/put', {a: '1'})
      assert_request_requested a_put('zaim/put').with(body: {a: '1'})
    end
  end

end