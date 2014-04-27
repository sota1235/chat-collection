require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/streaming'
require 'haml'
require 'coffee-script'
require 'cgi'

require_relative 'models/init'

class Server < Sinatra::Base
  @flag = true

  get '/' do
    haml :index
  end

  # comments要素を返す
  get '/comments' do
    handle = Handler.new
    comment = handle.getter
    json comment
=begin
    stream do |s|
      loop do
        break if @flag
        sleep 1
      end
      @flag = false
      json data
    end
=end
  end

  post '/post' do
    handle = Handler.new
    handle.writer(params[:name],params[:comment])
    @flag = true
  end
end
