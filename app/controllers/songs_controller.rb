class SongsController < ApplicationController

    before_action :song_select, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end
    
    def update
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private
    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def song_select
        @song = Song.find(params[:id])
    end

end
