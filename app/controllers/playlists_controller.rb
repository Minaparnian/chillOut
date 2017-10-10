class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def show
      @playlist = Playlist.find params[:id]
  end

  def create
    # raise
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

   track = Track.new
   track.song_id = params[song.external_urls]
   track.save

   # find the playlist

   playlist = Playlist.find params[:playlist_id]

   # add the track to the playlist: playlist.tracks << track

   playlist.add playlist.tracks
   # redirect to the search page again ( redirect_to :back )

   redirect_to :back

  # track.playlist = this.playlist

 end


  private
  def name_params
    params.require(:playlist).permit(:name)
  end
end
