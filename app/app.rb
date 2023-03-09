require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'
require 'bcrypt'

Dir[File.join(File.dirname(__FILE__), 'app', '**/*.rb')].each do |file|
  require file
end

class PetFinder < Sinatra::Base
  configure :development, :test do
    set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }
  end

  configure :production do
    set :database, ENV['DATABASE_URL']
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  helpers do
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def authenticate!
      unless current_user
        flash[:error] = 'You must be logged in to access this page.'
        redirect '/login'
      end
    end
  end
end
