require_relative '../models/pet'

class PetController < Sinatra::Base
  before do
    redirect '/login' unless session[:user_id]
  end

  get '/' do
    @pets = Pet.all
    erb :'pet/index'
  end

  get '/new' do
    erb :'pet/add'
  end

  post '/' do
    @pet = Pet.new(params[:pet])
    @pet.user_id = session[:user_id]
    if @pet.save
      redirect '/pets'
    else
      erb :'pet/add'
    end
  end

  get '/:id' do |id|
    @pet = Pet.find(id)
    erb :'pet/show'
  end

  get '/search' do
    @pets = Pet.search(params[:query])
    erb :'pet/search'
  end

  get '/:id/edit' do |id|
    @pet = Pet.find(id)
    if @pet.user_id == session[:user_id]
      erb :'pet/edit'
    else
      redirect '/pets'
    end
  end

  patch '/:id' do |id|
    @pet = Pet.find(id)
    if @pet.user_id == session[:user_id] && @pet.update(params[:pet])
      redirect "/pets/#{id}"
    else
      erb :'pet/edit'
    end
  end

  delete '/:id' do |id|
    pet = Pet.find(id)
    if pet.user_id == session[:user_id]
      pet.destroy
    end
    redirect '/pets'
  end
end
