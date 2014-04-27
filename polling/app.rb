require 'sinatra'
require 'sinatra/base'
require 'haml'
require 'coffee-script'
require 'cgi'

require_relative 'models/init'

class Server < Sinatra::Base
  get '/' do
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    handle = Handler.new
    @comments = handle.getter
    haml :comment
  end

  post '/' do
    handle = Handler.new
    @comments = handle.getter
    haml :comment
  end

  post '/comment' do
    handle = Handler.new
    handle.writer(params[:comment])
    redirect '/'
  end
end
