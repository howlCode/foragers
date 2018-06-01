class OrderMailer < ApplicationMailer
	default from: 'no-reply@howlcode.com'
	def order_confirmation_email(user, order)
		@user = user
		@order = order
		mail(to: @user.email, subject: "Shroom Hunters Order Summary")
	end
end