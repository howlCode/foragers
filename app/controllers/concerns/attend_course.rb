module AttendCourse
	def attend
		@course = Course.find(params[:id])
		@user = current_user
		if @course.size > @course.participants
			@course.participants += 1
			@course.save
			CourseMailer.confirmation_email(@user, @course).deliver_now
			flash[:notice] = 'You have successfully signed up for this course and will receive a confirmation email!'
			redirect_to courses_path
		else
			return 'Class is full!'
		end
	end
end