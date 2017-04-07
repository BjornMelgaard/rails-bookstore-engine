FactoryGirl.define do
  factory :product, class: 'Product' do
    title 'Title'
    price { FFaker.numerify('#.##') }
  end
end
