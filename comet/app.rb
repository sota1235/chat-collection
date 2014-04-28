require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/streaming'
require 'logger'
require 'haml'
require 'cgi'

require_relative 'models/init'

Log = Logger.new('app.log')

class Server < Sinatra::Base
  @@flag = true

  get '/' do
    Log.info("get /:" + @@flag.to_s)
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    Log.info("get /comments:" + @@flag.to_s)
    handle = Handler.new
    comment = JSON.generate(handle.getter)
    stream do |s|
      loop do
        break if @@flag
        sleep 1
      end
      @@flag = false
      s << comment
    end
  end

  post '/post' do
    Log.info("post /post:" + @@flag.to_s)
    @@flag = true
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
    JSON.generate(handle.getter)
  end
end
