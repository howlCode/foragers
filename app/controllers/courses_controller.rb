class CoursesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  
	def index
		@courses = Course.all
    @order = Order.where(id: session[:order_id]).first
	end

	def show
		@course = Course.find(params[:id])
    @order = Order.where(id: session[:order_id]).first
    respond_to do |format|
      format.js
    end
	end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  private
    def course_params
      params.require(:course).permit(:title, :description, :cost)
    end

end