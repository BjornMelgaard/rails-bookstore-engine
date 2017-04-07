module Shopper
  module ModelMethods
    extend ::ActiveSupport::Concern

    module ClassMethods
      def acts_as_product
        define_method :product_type do
          self.class.to_s.underscore
        end

        has_many :order_items,
                 class_name: 'Shopper::OrderItem',
                 as: :product,
                 dependent: :destroy
      end

      def acts_as_customer
        has_many :orders,
                 class_name: 'Shopper::Order',
                 as: :customer,
                 dependent: :destroy

        has_one :billing_address,
                class_name: 'Shopper::BillingAddress',
                as: :addressable,
                dependent: :destroy

        has_one :shipping_address,
                class_name: 'Shopper::ShippingAddress',
                as: :addressable,
                dependent: :destroy
      end
    end
  end
end
