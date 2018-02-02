class CreditCard < ApplicationRecord
	belongs_to :user, optional: true
	validates :name, :brand, :account, :exp_month, :exp_year, :cvc, presence: true

	validates :account, length: { minimum: 16, maximum: 19 }, format: { with: /[0-9]+/ }
	validates :exp_month, length: { is: 2 }, format: { with: /[0-9]+/ }
	validates :exp_year, length: { is: 4 }, format: { with: /[0-9]+/ }
	validates :cvc, format: { with: /[0-9]+/ }

	def last_4_digits(num)
		return num.to_s.split(//).last(4).join("")
	end

	def to_s
  	return "#{name}'s #{brand}, ----#{last_4_digits(account)}, #{exp_year}"
  end
end
