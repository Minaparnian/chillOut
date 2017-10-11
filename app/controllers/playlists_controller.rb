class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def show
      @playlist = Playlist.find params[:id]
  end

  def create
    playlist = Playlist.new(name_params)
    playlist.user_id = @current_user.id
    playlist.save
    redirect_to new_playlist_path
  end

  def destroy

   playlist = Playlist.find params[:id]
   playlist.destroy
   redirect_to new_playlist_path

 end


 def add
    # raise "error"

   # get the track info from spotify (RSpotify::Track.find params[:track_id])

   track = RSpotify::Track.find params[:track_id]

   # save the track into the rails database

   song = Song.new

    song.name = track.name
    song.preview_url = track.preview_url
    song.external_url = track.external_urls["spotify"]
    song.artist_name = track.artists.first.name
    song.images = track.album.images.last["url"]

    song.save
    #  find the playlist

   playlist = Playlist.find params[:playlist_id]

   # add the track to the playlist: playlist.tracks << track
   playlist.songs << song
   # redirect to the search page again ( redirect_to :back )

   redirect_back fallback_location: root_path

  # track.playlist = this.playlist

 end

 def remove

   playlist = Playlist.find params[:id]
   song  = Song.find params[:track_id]
   playlist.songs.destroy(song)
   redirect_back fallback_location: root_path

 end


  private
  def name_params
    params.require(:playlist).permit(:name)
  end
end
