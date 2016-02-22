ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class MakersBnb < Sinatra::Base
  get '/' do
    'Hello MakersBnb!'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do

    Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to])
    p Space.first
    redirect to '/spaces'
  end


  run! if app_file == $0
end
