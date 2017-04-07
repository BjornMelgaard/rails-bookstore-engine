feature 'Checkout page:' do
  before { create_list :product, 10 }
  let!(:countries) { create_list :country, 10 }

  describe 'Address step' do
    context 'without order items' do
      it 'should not allow to checkout page' do
        visit shopper.checkout_path(:address)
        expect(page).to have_current_path shopper.cart_path
      end
    end

    context 'with order items' do
      let(:order) { create :order, :with_items }
      before { stub_current_order_with(order) }
      before { visit shopper.checkout_path(:address) }

      before do
        within '.edit_order' do
          fill_address(:order, :billing,  attributes_for(:address), countries.first)
          fill_address(:order, :shipping, attributes_for(:address), countries.second)
        end
      end

      context 'when all fields valid' do
        it 'should show next step' do
          expect(Shopper::Address.all.count).to eq 0
          click_button I18n.t('simple_form.titles.save_and_continue')
          expect(page).to have_current_path shopper.checkout_path(:delivery)
          expect(Shopper::Address.all.count).to eq 2
        end
      end

      context 'when have invalid fields' do
        before do
          within '.edit_order' do
            fill_in 'order[billing][first_name]', with: ''
          end
        end

        it 'should show errors' do
          expect {
            click_button I18n.t('simple_form.titles.save_and_continue')
          }.not_to change {
            Shopper::Address.count
          }
          expect(page).to have_current_path shopper.checkout_path(:address)
          expect(page).to have_content 'can\'t be blank'
        end
      end
    end
  end
end
