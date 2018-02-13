class CoursesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show, :edit, :update]
  include AttendCourse
  
	def index
		@courses = Course.all
	end

	def show
    respond_to do |format|
      format.js
    end
	end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def update    
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  private
    def course_params
      params.require(:course).permit(:title, :location, :date, :description, :size, :participants)
    end

    def set_course
      @course = Course.find(params[:id])
    end

end