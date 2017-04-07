module Shopper
  class CheckoutMailer < Shopper.parent_mailer.constantize
    def complete(user, order)
      @user = user
      @order = order
      mail to: @user.email, subject: "Order #{@order.number} completed"
    end
  end
end
