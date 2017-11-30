class ArtistsController < ApplicationController
  before_action :get_artist, only: [:edit, :show]
  
  def index
    @artists = Artist.all
  end

  def show
  end

  def edit
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end    
  end

  def destroy
    Artist.find(params[:id]).destroy
    redirect_to artists_path
  end

  private
  
  def get_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end