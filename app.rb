require 'sinatra'
require 'holidapi'
require 'date'

class MyWebApp < Sinatra::Base
  get '/' do
    if params != nil and params.any?
      begin
        @holidays = HolidApi.get(country: params['country'], year: params['year'], month: params['month'])
      rescue
        @holidays = []
      end
    end
    erb :index
  end
end