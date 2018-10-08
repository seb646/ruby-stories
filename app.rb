require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/guest'

set :port, 8080
set :static, true
set :bind, '0.0.0.0'

get '/' do
    erb :index
end

post '/submit' do
	@guest = Guest.new(params[:guest])
	if @guest.save
		redirect '/guests'
	else
		"Uh oh - there was an error!"
	end
end

get '/guests' do
	@guests = Guest.all
	erb :guests
end