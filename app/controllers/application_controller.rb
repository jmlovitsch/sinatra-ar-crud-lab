
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
    end

  post '/articles' do
    @a = Article.create(title: params[:title], content: params[:content])
    redirect"/articles/#{@a.id}"
  end

  get '/articles/:id/edit' do |id|
    @article = Article.find_by_id(id)
    erb :edit
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do |id|
    @article = Article.find_by_id(id)
    erb :show
  end









  delete '/articles/:id' do |id|
    Article.find(id).delete
    redirect '/articles'
  end
end
