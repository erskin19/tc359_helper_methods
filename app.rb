require 'sinatra'
require 'cat_api'

require_relative 'helpers/methods_practice_helpers'

class MethodsPracticeApp < Sinatra::Base
  get '/' do
    @cat_image = CatAPI.new.get_images(type: 'gif').first
    erb :index
  end

  helpers MethodsPracticeHelpers
end
