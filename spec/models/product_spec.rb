require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:order_items) }

  describe 'test validations' do
    # Paperclip testing for the image attachment
    it { should have_attached_file(:image) }
    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:stock) }
  end

end