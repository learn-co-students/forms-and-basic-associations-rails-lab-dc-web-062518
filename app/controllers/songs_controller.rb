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
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end

  # def find_artist_id(song_params)
  #   Artist.find_by(name: song_params[:artist_name]).id
  # end
  #
  # def find_genre_id(song_params)
  #   Genre.find_by(name: song_params[:genre_name]).id
  # end

  def set_song
    @song = Song.find(params[:id])
  end
end
