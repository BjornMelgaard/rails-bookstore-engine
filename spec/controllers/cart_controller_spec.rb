require 'rails_helper'

module Shopper
  RSpec.describe CartController, type: :controller do
    routes { Shopper::Engine.routes }

    before { create_list :product, 10 }
    let(:coupon) { create :coupon }
    let(:second_coupon) { create :coupon }

    describe 'GET #add_product' do
      context 'valid params' do
        it 'renders js' do
          expect do
            post :add_product, params: { type: 'product', id: 1 }, format: :js, xhr: true
          end.to change { OrderItem.count }.by(1)

          expect(response).to render_template :add_product
        end
      end

      context 'invalid params' do
        it 'redirect via js' do
          expect do
            post :add_product, params: { type: 'product', id: 300 }, format: :js, xhr: true
          end.not_to change { OrderItem.count }

          # TODO: not a xhr
          # expect(response.body).to include 'Turbolinks.visit("http://test.host'
        end
      end
    end
  end
end
