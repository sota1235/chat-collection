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
  @@flag = nil

  get '/' do
    Log.info("get /:" + @@flag.to_s)
    @@flag = true
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    Log.info("get /comments:" + @@flag.to_s)
    handle = Handler.new
    stream do |s|
      loop do
        break if @@flag
        sleep 1
      end
      Log.info("get /comments break:" + @@flag.to_s)
      comment = JSON.generate(handle.getter)
      @@flag = false
      s << comment
    end
  end

  post '/comments' do
    Log.info("post /comments:" + @@flag.to_s)
    @@flag = true
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
  end
end
