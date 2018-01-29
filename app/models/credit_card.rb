class CreditCard < ApplicationRecord
	belongs_to :user, optional: true
	validates :name, :brand, :account, :expiration, :cvc, presence: true

	validates :account, numericality: { only_integer: true }, length: { minimum: 16, maximum: 19 }
	validates :expiration, numericality: { only_integer: true }
	validates :cvc, numericality: { only_integer: true }

	def to_s
  	return "#{brand}, #{expiration}"
  end
end
