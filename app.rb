# app.rb
require 'sinatra'

class MyWebApp < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/about' do
    erb :about
  end
end