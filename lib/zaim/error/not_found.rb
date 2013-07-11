require 'zaim/error/client_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 404
    class NotFound < Zaim::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
