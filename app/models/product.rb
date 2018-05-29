class Product < ApplicationRecord
	validates :name, :description, :price, :stock, :image, presence: true
	has_attached_file :image, styles: { medium: "300x300>", shop_size: "200x200>", thumb: "100x100>" }, default_url: "shopping-cart.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :order_items
end
