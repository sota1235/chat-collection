require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'haml'
require 'coffee-script'
require 'cgi'

require_relative 'models/init'

class Server < Sinatra::Base
  @flat = true

  get '/' do
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    handle = Handler.new
    comment = nil
    loop do
      if @flag then
        comment = handle.getter
        @flag = false
        break
      end
      sleep 1
    end
    json comment
  end

  post '/post' do
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
    @flag = true
  end
end
