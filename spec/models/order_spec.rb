require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'test validations' do
    it { should belong_to(:user) }
    it { should belong_to(:address) }
    it { should belong_to(:credit_card) }
    it { should have_many(:order_items).dependent(:destroy) }
  end
end