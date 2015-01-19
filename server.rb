require 'data_mapper'
require './lib/post.rb'
require './lib/user.rb'
require 'sinatra/base'
require 'rack-flash'



class Chitter < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

  get '/' do
    @post = Post.all
    erb :index
  end

  post '/post' do
    title = params["title"]
    text = params["text"]
    Post.create(:title => title, :text => text)
    redirect to('/')
  end


end

