FactoryGirl.define do
  factory :order_item, class: 'Shopper::OrderItem' do
    quantity 1
    order
    association :product
  end
end
