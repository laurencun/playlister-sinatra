require 'rack-flash'
require 'pry'
class SongsController < ApplicationController
    enable :sessions 
    use Rack::Flash 
    get '/songs' do
        @songs = Song.all 
        erb :"songs/index"
    end
    get '/songs/new' do
        erb :'songs/new'
    end
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
       erb :'songs/show'
    end
    post '/songs' do
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        # @song.genres = Genre.find_by(name: params[:genre])
        # @song.genre_ids = params[:genres]
        Genre.all.select do |g| 
            g.name == params[:genres]
            @song.genres << g
        end
        @song.save 
         flash[:message] = "Successfully created song."
        redirect ("/songs/#{@song.slug}")
    end
end