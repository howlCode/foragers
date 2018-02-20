require 'rails_helper'

RSpec.describe Shroom, type: :model do
  it { should belong_to(:user) }

  describe 'test validations' do
    # Paperclip testing for the image attachment
    it { should have_attached_file(:image) }
    
    # Validations
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:edible) }
    it { should validate_presence_of(:image) }
  end

end