# Required Programs 
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'

# Models
require './models/user'
require './models/post'

# Cloud 9 Config
set :port, 8080
set :static, true
set :bind, '0.0.0.0'

# Routes 
get '/' do
    erb :index
end
	
# Enable Sessions
enable :sessions

# Route :: Users
get '/users' do
	@users = User.all
	erb :users
end

get '/users/home' do
  @user = User.find(session[:id])
  @posts = Post.where("user_id = ?", @user.id)
  
  erb :'/users/home'
end
	
# Route :: Posts
get '/posts' do
	@posts = Post.all
	erb :posts
end

get '/create-post' do
	
	erb :create_post
end
	
post '/submit-post' do	
	@post = Post.new(params[:post])
	if @post.save
		redirect '/posts'
	else
		"Sorry, there was an error!"
	end
end

# Route :: User Registrations 
get '/login/register' do
    erb :'/login/register'
end

post '/register' do
	@user = User.new(params[:user])
	if @user.save
		if @user.bravery == true and @user.flight == true and @user.speed == true 
			then @user.update(avatar: 'Buzzard')
		elsif @user.bravery == true and @user.flight == true and @user.vision == true 
			then @user.update(avatar: 'Eagle')
		elsif @user.bravery == true and @user.flight == true and @user.strength == true 
			then @user.update(avatar: 'Vulture')
		elsif @user.flight == true and @user.speed == true and @user.vision == true 
			then @user.update(avatar: 'Falcon')
		elsif @user.flight == true and @user.speed == true and @user.strength == true 
			then @user.update(avatar: 'Osprey')
		elsif @user.speed == true and @user.strength == true and @user.bravery == true 
			then @user.update(avatar: 'Lion')
		elsif @user.speed == true and @user.vision == true and @user.bravery == true 
			then @user.update(avatar: 'Panther')
		elsif @user.strength == true and @user.speed == true and @user.vision == true 
			then @user.update(avatar: 'Kangaroo')
		elsif @user.strength == true and @user.flight == true and @user.vision == true 
			then @user.update(avatar: 'Hawk')
		elsif @user.vision == true and @user.speed == true and @user.strength == true 
			then @user.update(avatar: 'Tiger')
		end
		
		redirect '/login/index'
	else
		"Sorry, there was an error!"
	end
end

# Route :: Sessions & Login
get '/login/index' do
	erb :'/login/index'
end

post '/login' do
	@user = User.find_by(email: params["email"], password: params["password"])
	if @user != nil
		session[:id] = @user.id
		redirect '/users/home'
	else
		redirect '/login/index'
	end
end

get '/logout' do
	session.clear
	redirect '/'
end