require 'zaim/identity'

module Zaim
  class Category < Zaim::Identity
    attr_reader :name, :mode, :sort, :parent_category_id,
      :color, :image, :budget, :edit_flag, :active, :calc

    # Time when the Money object was last modified on Zaim
    #
    # @return [Time]
    def modified
      @modified ||= Time.parse(@attrs[:modified]) rescue nil
    end

  end
end
