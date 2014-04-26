require 'sinatra'
require 'sinatra/base'
require 'haml'
require 'coffee-script'

require_relative 'models/init'

class Server < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/script.js' do
    coffee :script
  end

  post '/' do

  end
end
