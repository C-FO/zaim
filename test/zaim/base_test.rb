require 'test_helper'

describe Zaim::Base do
  before do
    @base = Zaim::Base.new(id: 1, name: 'abc')
  end

  describe '.attr_reader' do
    before do
      Zaim::Base.attr_reader(:name)
    end

    it 'defines a setter method' do
      @base.name.must_equal 'abc'
    end

    it 'defines a existence checker method' do
      @base.name?.must_equal true
    end
  end

  describe '.from_response' do
    it 'returns an instance of Zaim::Base' do
      Zaim::Base.from_response(body: {id: 1}).must_be_instance_of Zaim::Base
    end
  end

  describe '#initialize' do
    it 'returns an instance of Zaim::Base' do
      Zaim::Base.new.must_be_instance_of Zaim::Base
    end
  end

  describe '#[]' do
    it 'with a symbol argument' do
      @base[:class].must_equal Zaim::Base
    end

    it 'with a string argument' do
      @base[:class].must_equal Zaim::Base
    end

    it 'with a missing attribute' do
      @base['zaim'].must_be_nil
    end
  end

  describe '#attrs' do
    it 'returns a hash of attributes' do
      @base.attrs.must_equal({id: 1, name: 'abc'})
    end
  end

  describe '#update' do
    it 'updates an attribute' do
      @base.update(id: 2)
      @base.attrs[:id].must_equal 2
    end
  end

end