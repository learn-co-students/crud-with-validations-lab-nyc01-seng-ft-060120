class SongsController < ApplicationController
  before_action :set_song, only: [:edit, :update, :show, :destroy]

  def index
    @songs = Song.all
  end
  
  def show
    
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render 'new'
    end
  end


  def update
    @song = Song.find(params[:id])
      if @song.update_attributes(song_params)
        redirect_to @song
      else
        render 'edit'
      end
  end
  
  def destroy
    @song = Song.find(params[:id])
    if @song.destroy
      flash[:success] = 'Song was successfully deleted.'
      redirect_to songs_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to songs_url
    end
  end
  
  

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def set_song
    @song = Song.find(params[:id])
  end
  
  
  
end


