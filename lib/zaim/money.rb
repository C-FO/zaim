require 'zaim/identity'
require 'zaim/money'
require 'zaim/stamp'
require 'zaim/user'

module Zaim
  class Money < Zaim::Identity
    attr_reader :type, :user_id, :category_id,
      :genre_id, :to_account_id, :from_account_id,
      :amount, :comment, :place, :currency_code

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
      @kiriban_stamp ||= Zaim::Stamp.new(@attrs[:stamps][:kiriban] || {})
    end

    def repeat_stamp
      @repeat_stamp ||= Zaim::Stamp.new(@attrs[:stamps][:repeat] || {})
    end

    def first_stamp
      @repeat_stamp ||= Zaim::Stamp.new(@attrs[:stamps][:first] || {})
    end

  end
end