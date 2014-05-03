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
    Log.info("get '/': " + @@time.to_s)
    haml :index
  end

  # return comments when GET '/' request
  get '/first_comments' do
    Log.info("get '/first_comments': " + @@time.to_s)
    JSON.generate(@@handle.getter)
  end

  # return comments
  get '/comments' do
    Log.info("get '/comments': " + @@time.to_s)
    t = @@handle.get_timestamp
    stream do |s|
      loop do
        #if @@time != t then
        if @@c > 0 then
          @@c -= 1
          break
        end
        sleep 1
      end
      Log.info("get '/comments break': " + @@time.to_s + " : " + t.to_s)
      comment = JSON.generate(@@handle.getter)
      s << comment
    end
  end

  post '/comments' do
    Log.info("post '/comments': " + @@time.to_s)
    @@handle.writer(params[:name],params[:comment])
    @@c += 1
    @@time = @@handle.get_timestamp
  end
end
