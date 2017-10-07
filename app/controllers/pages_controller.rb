class PagesController < ApplicationController
  def index
    # <input name="artist">
    @artist = Artist.new
  end

  def search
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    @tracks = RSpotify::Artist.search params[:artist]
  end
end
