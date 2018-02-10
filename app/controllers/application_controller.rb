require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.name = params[:name]
    post.content = params[:content]
    post.save

    redirect '/posts/#{params[:id]}'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end


  get '/posts/new' do
    erb :new
  end


  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end


  get '/posts' do
    @posts = Post.all
    erb :index
  end


  post '/posts' do
    @name = params[:name]
    @content = params[:content]

    new_post = Post.create(:name => @name, :content => @content)
    @posts = Post.all

    erb :index

  end

end
