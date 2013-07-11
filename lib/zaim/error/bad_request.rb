require 'zaim/error/client_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 400
    class BadRequest < Zaim::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end
