require 'zaim/identity'

module Zaim
  class Account < Zaim::Identity
    attr_reader :name, :sort, :color, :icon_url,
      :description, :currency_code, :goal, 
      :abs_flag, :edit_flag, :active

    # Time when the Money object was last modified on Zaim
    #
    # @return [Time]
    def modified
      @modified ||= Time.parse(@attrs[:modified]) rescue nil
    end

  end
end