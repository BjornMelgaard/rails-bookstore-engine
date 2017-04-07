module Shopper
  module OrderItemArithmeticHelpers
    def subtotal
      quantity * product.price
    end
  end
end
