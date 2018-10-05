class CourseMailer < ApplicationMailer
	default from: 'no-reply@howlcode.com'
	def confirmation_email(user, course)
		@user = user
		@course = course
		mail(to: @user.email, subject: "Foragers Course Confirmation")
	end
end
