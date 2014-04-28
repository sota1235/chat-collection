require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/streaming'
require 'logger'
require 'haml'
require 'cgi'

require_relative 'models/init'

@@flag = true
Log = Logger.new('app.log')

class Server < Sinatra::Base
  get '/' do
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    handle = Handler.new
    comment = handle.getter
    stream do |s|
      loop do
        break if @@flag
        sleep 1
      end
      json comment
    end
  end

  post '/post' do
    @@flag = true
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
  end
end
