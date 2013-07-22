require 'test_helper.rb'

describe Zaim::API::Genres do

  describe '#genre_home_get' do
    before :all do
      stub_get('v2/home/genre').to_return(body: fixture('genre_home.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @genres = Zaim::Client.new.genre_home_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/home/genre')
    end

    it 'returns an array of instances of Zaim::Genre' do
      @genres.count.must_equal @genres.select {|a| a.is_a? Zaim::Genre}.count
    end
  end

  describe '#genre_get' do
    before :all do
      stub_get('v2/genre').to_return(body: fixture('genre.json'), headers: {content_type: 'application/json; charset=utf-8'})
      @genres = Zaim::Client.new.genre_get
    end

    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('v2/genre')
    end

    it 'returns an array of instances of Zaim::Genre' do
      @genres.count.must_equal @genres.select {|a| a.is_a? Zaim::Genre}.count
    end
  end

end