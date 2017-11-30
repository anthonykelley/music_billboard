class BillboardsController < ApplicationController
  before_action :get_billboard, only: [:edit, :show]

  def index
    @billboards = Billboard.all
  end

  def show
  end

  def edit
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def update
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      render :edit
    end    
  end

  def destroy
    Billboard.find(params[:id]).destroy
    redirect_to billboards_path
  end

  private
  
  def get_billboard
    @billboard = Billboard.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:title, :rank)
  end
end
