require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'haml'
require 'coffee-script'
require 'cgi'

require_relative 'models/init'

class Server < Sinatra::Base
  @time = true

  get '/' do
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    handle = Handler.new
    comment = nil
    if @time then
      @time = handle.get_timestamp
      json handle.getter
    else
      loop do
        unless @time == handle.get_timestamp then
          comment = handle.getter
          break
        end
        sleep 1
      end
    end
    json comment
  end

  post '/post' do
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
  end
end
