class CreditCard < ApplicationRecord
	belongs_to :user, optional: true
	validates :name, :brand, :account, :exp_month, :exp_year, :cvc, presence: true

	validates :account, numericality: { only_integer: true }
	validates :exp_month, numericality: { only_integer: true }
	validates :exp_year, numericality: { only_integer: true }
	validates :cvc, numericality: { only_integer: true }

	def last_4_digits(num)
		return num.to_s.split(//).last(4).join("")
	end

	def to_s
  	return "#{name}'s #{brand}, ----#{last_4_digits(account)}, #{expiration}"
  end
end
