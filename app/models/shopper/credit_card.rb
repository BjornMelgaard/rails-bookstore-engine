module Shopper
  class CreditCard < ApplicationRecord
    belongs_to :order

    def to_s
      number
    end
  end
end
