require 'zaim/error/client_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 401
    class Unauthorized < Zaim::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end
