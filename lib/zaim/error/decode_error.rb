require 'zaim/error'

module Zaim
  class Error
    # Raised when JSON parsing fails
    class DecodeError < Zaim::Error
    end
  end
end