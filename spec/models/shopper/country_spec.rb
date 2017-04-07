require 'rails_helper'

module Shopper
  RSpec.describe Country, type: :model do
    context 'Validation' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:code) }
    end
  end
end
