module Shopper
  module CartPage
    class CartPresenter < Rectify::Presenter
      def initialize(order, coupon = nil, items = nil)
        @order = order
        @coupon = Shopper::CartPage::CouponDecorator
                  .new(coupon || order.coupon || Shopper::Coupon.new)
        @items = Shopper::ItemsTable::ItemDecorator
                 .for_collection(items || order.order_items, description: false)
      end

      attr_reader :coupon, :items

      def order_summary
        Shopper::OrderSummary::OrderDecorator.new(current_order, deficit_method: :show_zero)
      end

      def order_details
        Shopper::OrderDetails::OrderDecorator.new(@order, edit_link: true)
      end

      def checkout_path
        @checkout_path ||= begin
          step = Shopper::CheckoutManager.new(@order).minimal_accessible_step
          view_context.checkout_path(step)
        end
      end

      def cart_empty?
        @order.order_items.empty?
      end
    end
  end
end
