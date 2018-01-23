class Address < ApplicationRecord
  validates :line1, :city, :state, :zip, presence: true
  validates :zip, length: { is: 5 }, numericality: { only_integer: true }
  validates :state, length: { is: 2 }
  belongs_to :user, optional: true
  has_many :orders
end
