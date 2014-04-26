require 'sinatra'
require 'sinatra/base'
require 'haml'
require 'coffee-script'

require_relative 'models/init'

class Server < Sinatra::Base
  get '/' do
    handle = Handle.new
    @comments = handle.getter
    haml :index
  end

  get '/script.js' do
    coffee :script
  end

  post '/' do
    handle = Handle.new
    @comments = handle.getter
    haml :index
  end

  post '/comment' do
    handle = Handle.new
    handle.writer(params[:comment])
    redirect '/'
  end
end
