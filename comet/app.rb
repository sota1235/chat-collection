require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'logger'
require 'haml'

require_relative 'models/init'

Log = Logger.new('app.log')

class Server < Sinatra::Base
  @@handle = Handler.new
  @@time = @@handle.get_timestamp
  @@c = 0

  get '/' do
    haml :index
  end

  # return comments when GET '/' request
  get '/first_comments' do
    JSON.generate(@@handle.getter)
  end

  # return comments
  get '/comments' do
    t = @@handle.get_timestamp
    Log.info("get /comments")
    loop do
      #if @@time != t then
      if t != @@time then
        break
      end
      sleep 1
    end
    Log.info("get /comments : break")
    comment = JSON.generate(@@handle.getter)
    comment
  end

  post '/comments' do
    @@handle.writer(params[:name],params[:comment])
    @@time = @@handle.get_timestamp
  end
end
