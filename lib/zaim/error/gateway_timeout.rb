require 'zaim/error/server_error'

module Zaim
  class Error
    # Raised when Zaim returns the HTTP status code 504
    class GatewayTimeout < Zaim::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The Zaim servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end
