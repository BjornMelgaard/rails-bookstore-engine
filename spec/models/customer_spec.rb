require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Associations' do
    it { should have_many(:orders).dependent(:destroy) }
  end

  it_behaves_like 'addressable'
end
