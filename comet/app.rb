require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'haml'
require 'coffee-script'
require 'cgi'

require_relative 'models/init'

class Server < Sinatra::Base
  get '/' do
    @flag = true
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    handle = Handler.new
    loop do
      if @flag then
        json handle.getter
        @flag = false
        break
      end
    end
  end

  post '/post' do
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
    @flag = true
  end
end
