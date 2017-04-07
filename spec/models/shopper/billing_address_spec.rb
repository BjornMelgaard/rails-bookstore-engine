require 'rails_helper'

module Shopper
  RSpec.describe BillingAddress, type: :model do
    it { expect(BillingAddress.superclass).to eq(Address) }
  end
end
