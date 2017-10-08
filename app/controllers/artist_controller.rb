class ArtistController < ApplicationController
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
    @tracks = RSpotify::Artist.search params[:artist]
    RSpotify::Artist.find params[:name]
  end
end
