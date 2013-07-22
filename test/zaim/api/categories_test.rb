require 'test_helper.rb'

describe Zaim::API::Categories do

  describe '#category_home_get' do
    before do
      stub_get('v2/home/category').to_return(body: fixture('category_home.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @categories = Zaim::Client.new.category_home_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/home/category')
    end

    it 'returns an array of instances of Zaim::Category' do
      @categories.count.must_equal @categories.select {|a| a.is_a? Zaim::Category}.count
    end
  end

  describe '#category_get' do
    before do
      stub_get('v2/category').to_return(body: fixture('category.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @categories = Zaim::Client.new.category_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/category')
    end

    it 'returns an array of instances of Zaim::Category' do
      @categories.count.must_equal @categories.select {|a| a.is_a? Zaim::Category}.count
    end
  end

end