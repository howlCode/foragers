class ShroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @shrooms = Shroom.all
  end

  def show
    @shroom = Shroom.find(params[:id])
    redirect_to shrooms_path
  end

  def new
    @shroom = current_user.shrooms.build
  end

  def edit
    @shroom = Shroom.find(params[:id])
  end

  def create
    @shroom = current_user.shrooms.build(shroom_params)

    if @shroom.save
      redirect_to @shroom
    else
      render 'new'
    end
  end

  def update
    @shroom = Shroom.find(params[:id])

    if @shroom.update(shroom_params)
      redirect_to @shroom
    else
      render 'edit'
    end
  end

  def destroy
    @shroom = Shroom.find(params[:id])
    @shroom.destroy

    redirect_to shrooms_path
  end

  private
    def shroom_params
      params.require(:shroom).permit(:name, :description, :edible, :genus, :image)
    end

end
