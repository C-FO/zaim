require 'zaim/error/server_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 500
    class InternalServerError < Zaim::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = 'Something is technically wrong.'
    end
  end
end
