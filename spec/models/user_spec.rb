require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_many(:orders) }
  it { should have_many(:addresses) }
  it { should have_many(:credit_cards) }
  it { should have_many(:shrooms) }
end