require 'zaim/error/client_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 403
    class Forbidden < Zaim::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end
