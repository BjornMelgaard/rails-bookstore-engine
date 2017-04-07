require 'rails_helper'

module Shopper
  RSpec.describe OrderItemController, type: :controller do
    routes { Shopper::Engine.routes }

    describe '#destroy' do
      it 'destroy if authorized' do
        order = create :order, :with_items
        stub_current_order_with(order)
        item = order.order_items.first
        expect do
          delete :destroy, params: { id: item.id }
        end.to change { OrderItem.count }.by(-1)
      end
    end
  end
end
