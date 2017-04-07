require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Associations' do
    it { should have_many(:order_items).dependent(:destroy) }
  end
end
