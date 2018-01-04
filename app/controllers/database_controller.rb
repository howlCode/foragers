class DatabaseController < ApplicationController
  def index
    @shrooms = Shroom.all
  end

  def show 
    @shroom = Shroom.find(params[:id])
  end

  def new
    @shroom = Shroom.new
  end

  def edit
    @shroom = Shroom.find(params[:id])
  end

  def create
    @shroom = Shroom.new(shroom_params)

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
  
  private
    def shroom_params
      params.require(:shroom).permit(:name, :description)
    end

end
