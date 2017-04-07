require 'rails_helper'

module Shopper
  RSpec.describe CreditCard, type: :model do
    it { should belong_to :order }
  end
end
