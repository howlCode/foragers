class CourseMailer < ApplicationMailer
	default from: 'shroom_hunters@shroom-hunters.com'
	def confirmation_email(user, course)
		@user = user
		@course = course
		mail(to: @user.email, subject: "Shroom Hunters Course Confirmation")
	end
end
