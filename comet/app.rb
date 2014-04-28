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
    haml :index
  end

  # comments要素を返す
  get '/comments' do
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
    @@flag = true
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
  end
end
