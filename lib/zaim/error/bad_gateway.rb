require 'zaim/error/server_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 502
    class BadGateway < Zaim::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = 'Zaim is down or being upgraded.'
    end
  end
end
