require_relative '../models/user'

class UserController < Sinatra::Base
  enable :sessions

  get '/register' do
    erb :'user/register'
  end

  post '/register' do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect '/profile'
    else
      erb :'user/register'
    end
  end

  get '/login' do
    erb :'user/login'
  end

  post '/login' do
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/profile'
    else
      erb :'user/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/profile' do
    @user = User.find(session[:user_id])
    erb :'user/profile'
  end
end
