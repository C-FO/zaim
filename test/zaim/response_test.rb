require 'test_helper.rb'

describe Zaim::Response::RaiseError do

  describe '#on_complete' do
    before do
      @raise_error = Zaim::Response::RaiseError.new({}, Zaim::Error)
    end

    it 'raises 400 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 400}) }.must_raise Zaim::Error::BadRequest
    end

    it 'raises 401 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 401}) }.must_raise Zaim::Error::Unauthorized
    end

    it 'raises 403 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 403}) }.must_raise Zaim::Error::Forbidden
    end

    it 'raises 404 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 404}) }.must_raise Zaim::Error::NotFound
    end

    it 'raises 406 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 406}) }.must_raise Zaim::Error::NotAcceptable
    end

    it 'raises 500 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 500}) }.must_raise Zaim::Error::InternalServerError
    end

    it 'raises 502 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 502}) }.must_raise Zaim::Error::BadGateway
    end

    it 'raises 503 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 503}) }.must_raise Zaim::Error::ServiceUnavailable
    end

    it 'raises 504 Zaim::Error::BadRequest' do
      -> { @raise_error.on_complete({status: 504}) }.must_raise Zaim::Error::GatewayTimeout
    end

  end

end