module Shopper
  module CartPage
    class UpdateOrderItems
      def initialize(params, order)
        @params = params
        @order = order
      end

      attr_reader :items

      def call
        return true unless iparams
        @items = update
        @items.all?(&:valid?)
      end

      private

      def update
        @order.order_items.update(iparams.keys, iparams.values)
      end

      def iparams
        return @iparams if instance_variable_defined?('@iparams')
        @iparams = @params.permit(items: [:quantity]).require(:items)
      rescue ActionController::ParameterMissing
        @iparams = nil
      end
    end
  end
end
