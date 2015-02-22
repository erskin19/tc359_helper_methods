require 'sinatra'
require 'holidapi'
require 'date'

class MyWebApp < Sinatra::Base
  get '/' do
	@time = Time.now
    @holidays = HolidApi.get(country: 'us', year: @time.year, month: @time.month)
    @birthHolidays = HolidApi.get(country: 'us', year: '1994', month: '7')
    erb :index
  end
end