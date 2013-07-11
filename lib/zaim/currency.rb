module Zaim
  class Currency < Zaim::Base
    attr_reader :currency_code, :unit, :point, :name
  end
end