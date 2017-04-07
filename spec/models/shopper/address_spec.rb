require 'rails_helper'

module Shopper
  RSpec.describe Address, type: :model do
    describe 'Validation' do
      it { should validate_presence_of(:country) }
    end

    describe 'Associations' do
      it { should belong_to(:country) }
      it { should belong_to(:addressable) }
    end
  end
end
