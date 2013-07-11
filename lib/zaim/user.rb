require 'zaim/identity'

module Zaim
  class User < Zaim::Identity
    attr_reader :login, :name, :input_count,
      :day_count,:repeat_count, :day, :week,
      :month, :currency_code, :profile_image_url,
      :cover_image_url

    def self.from_response(response={})
      new(response[:body][:me])
    end

  end
end
