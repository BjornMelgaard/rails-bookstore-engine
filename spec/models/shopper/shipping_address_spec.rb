require 'rails_helper'

module Shopper
  RSpec.describe ShippingAddress, type: :model do
    it { expect(ShippingAddress.superclass).to eq(Address) }
  end
end
