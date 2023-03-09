# class ApplicationController < Sinatra::Base
#     enable :sessions
#     set :session_secret, 'my_secret'
#     set :views, File.expand_path('../../views', __FILE__)
  
#     get '/' do
#       erb :index
#     end
  
#     not_found do
#       erb :error
#     end
  
#     error do
#       erb :error
#     end
  
#     helpers do
#       def current_user
#         @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
#       end
  
#       def logged_in?
#         !!current_user
#       end
  
#       def authenticate!
#         redirect '/login' unless logged_in?
#       end
  
#       def authorize!(pet)
#         redirect '/login' unless pet.owner_id == session[:user_id]
#       end
#     end
#   end
  