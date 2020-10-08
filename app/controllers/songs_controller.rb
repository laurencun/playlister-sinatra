class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all 
        erb :"songs/index"
    end

    get '/songs/new' do
        erb :songs/new
    end

    post '/songs' do
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by_name(params[:artist][:name])
        @song.genre_id = params[:genres]
        redirect to  '/songs/#{@song.slug}'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
       er :'songs/show'
    end

end