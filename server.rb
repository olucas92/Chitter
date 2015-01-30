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

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @post = Post.all
    erb :index
  end

  post '/post' do
    title = params["title"]
    text = params["text"]
    post = Post.create(:title => title, :text => text)
    redirect to('/')
  end

  get '/user/new' do
    erb :"user/new"
  end

  post '/user' do
    puts "^" * 100
    puts params
    User.create(:email => params[:email],
                :password => params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end


end

