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
  @@handle = Handler.new
  @@time = @@handle.get_timestamp

  get '/' do
    Log.info("get '/'")
    haml :index
  end

  # return comments when GET '/' request
  get '/first_comments' do
    Log.info("get '/first_comments'")
    JSON.generate(@@handle.getter)
  end

  # return comments
  get '/comments' do
    Log.info("get '/comments'")
    stream do |s|
      loop do
        t = @@handle.get_timestamp
        if @@time != t then
          @@time = t
          break
        end
        sleep 1
      end
      Log.info("get '/comments break'")
      comment = JSON.generate(@@handle.getter)
      s << comment
    end
  end

  post '/comments' do
    Log.info("post '/comments'")
    @@handle.writer(params[:name],params[:comment])
  end
end
