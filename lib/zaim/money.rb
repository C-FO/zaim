require 'zaim/identity'
require 'zaim/money'
require 'zaim/stamp'
require 'zaim/user'

module Zaim
  class Money < Zaim::Identity
    attr_reader :mode, :user_id, :category_id,
      :genre_id, :to_account_id, :from_account_id,
      :amount, :comment, :place, :currency_code,
      :active, :name, :receipt_id

  	# Date when the Money object was created on Zaim
  	#
  	# @return [Date]
    def date
      @date ||= Date.parse(@attrs[:date]) rescue nil
    end

    # Time when the Money object was created on Zaim
    #
    # @return [Time]
    def created
      @created ||= Time.parse(@attrs[:created]) rescue nil
    end

  end

  class Money::Response < Zaim::Base
    def user
      @user ||= Zaim::User.new(@attrs[:user])
    end

    def money
      @money ||= Zaim::Money.new(@attrs[:money])
    end

    def kiriban_stamp
      @kiriban_stamp ||= if @attrs[:stamps] && @attrs[:stamps][:kiriban]
        Zaim::Stamp.new(@attrs[:stamps][:kiriban])
      else
        nil
      end
    end

    def repeat_stamp
      @repeat_stamp ||= if @attrs[:stamps] && @attrs[:stamps][:repeat]
        Zaim::Stamp.new(@attrs[:stamps][:repeat])
      else
        nil
      end
    end

    def first_stamp
      @first_stamp ||= if @attrs[:stamps] && @attrs[:stamps][:first]
        Zaim::Stamp.new(@attrs[:stamps][:first])
      else
        nil
      end
    end

  end
end
