require 'test_helper'

describe Zaim::API::Genres do

  describe '#genre_home_get' do

    describe 'with authorized user' do
      before do
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

    describe 'without authorization' do
      before do
        stub_get('v2/home/genre').to_return(status: [401, 'Unauthorized'])
      end

      after { WebMock.reset! }

      it 'raises Zaim::Error::Unauthorized' do
        -> { Zaim::Client.new.genre_home_get }.must_raise Zaim::Error::Unauthorized
      end
    end
  end

  describe '#genre_get' do
    before do
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