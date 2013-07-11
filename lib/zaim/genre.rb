require 'zaim/identity'

module Zaim
  class Genre < Zaim::Identity
    attr_reader :name, :sort, :parent_genre_id,
      :category_id, :edit_flag, :active

    # Time when the Money object was last modified on Zaim
    #
    # @return [Time]
    def modified
      @modified ||= Time.parse(@attrs[:modified]) rescue nil
    end

  end
end
