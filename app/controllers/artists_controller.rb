class ArtistsController < ApplicationController
  def index
    # <input name="artist">
     @artist = Artist.new
  end

  def new
  end

  def show
  end


  def search
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    @artist = RSpotify::Artist.search(params[:name]).first
    @tracks = @artist.top_tracks(:US)
    
    # RSpotify::Artist.find params[:name]
    # render json: @tracks
  end
end
