require 'test_helper'

describe Hash do

  describe '#deep_symbolize_keys' do
    before do
      @hash = {'a' => 1, 'b' => {'c' => 1}}.deep_symbolize_keys
    end

    it '@hash[:a]' do
      @hash[:a].must_equal 1
    end

    it '@hash[:b]' do
      @hash[:b].must_equal({c: 1})
    end
  end

end