module Shopper
  module CartPage
    class AddProduct < Rectify::Command
      def initialize(params)
        @product_type = params[:type]
        @product_id = params[:id]
        @quantity = params[:quantity] || 1
      end

      def call
        item = current_order.create_or_increment_product(@product_type, @product_id, @quantity)
        item ? broadcast(:ok) : broadcast(:invalid_product)
      end
    end
  end
end
