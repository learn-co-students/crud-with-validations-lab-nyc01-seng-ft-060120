class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy, :update, :edit]
  def index
    @songs = Song.all
  end

  def show
    redirect_to @song
  end
  
  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song 
    else
      flash[:errors] = @song.errors.full_messages
      render :new
    end
  end

  def update
    @song.update(song_params)
    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :genre, :artist_name, :released, :release_year)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
