class ShroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_shroom, only: [:show, :edit, :update, :destroy]
  
  def index
    @shrooms = Shroom.all
    @shrooms = Shroom.where(genus: params[:genus_filter]) if params[:genus_filter].present?
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @shroom = current_user.shrooms.build
  end

  def edit
  end

  def create
    @shroom = current_user.shrooms.build(shroom_params)

    if @shroom.save
      redirect_to shrooms_path
    else
      render 'new'
    end
  end

  def update
    if @shroom.update(shroom_params)
      redirect_to shrooms_path
    else
      render 'edit'
    end
  end

  def destroy
    @shroom.destroy

    redirect_to shrooms_path
  end

  private
    def shroom_params
      params.require(:shroom).permit(:name, :description, :edible, :genus, :image, :genus_filter)
    end

    def set_shroom
      @shroom = Shroom.find(params[:id])
    end

end
