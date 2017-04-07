FactoryGirl.define do
  factory :customer do
    email      { FFaker::Internet.email }

    trait :with_addresses do
      after(:create) do |user|
        create(:billing_address, addressable: user)
        create(:shipping_address, addressable: user)
      end
    end
  end
end
