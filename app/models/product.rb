class Product < ApplicationRecord
	validates :name, :description, :price, :image, presence: true
	has_many :line_items, dependent: :destroy
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "shopping-cart.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
