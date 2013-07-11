require 'zaim/error/client_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 406
    class NotAcceptable < Zaim::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end
