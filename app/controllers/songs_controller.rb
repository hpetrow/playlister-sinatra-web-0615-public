class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    
    erb :"songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all

    erb :"songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :"songs/edit"
  end

  post "/songs" do
    @song = Song.new(params[:song])
    @song.save

    @status = "Successfully created song."
    erb :"songs/show"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    @status = "Song successfully updated."
    erb :"songs/show"
  end
end
