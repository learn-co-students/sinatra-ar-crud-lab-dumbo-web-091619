
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  redirect to "/articles"
  end
  
  #index
  get '/articles' do
    @articles = Article.all #define instance variable for view
    erb :index #show all articles view (index)
  end

  #new
  get '/articles/new' do
    @article = Article.new
    erb :new #show new articles view
  end

  #create
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  #show
  get '/articles/:id' do
    #gets params from url
    @article = Article.find(params[:id]) #define instance variable for view
    erb :show #show single article view
  end

  #edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id]) #define intstance variable for view
    erb :edit #show edit article view
  end

  #update
  patch '/articles/:id' do
    @article = Article.find(params[:id]) #define variable to edit
    @article.update(params[:article]) #assign new attributes
    redirect "/articles/#{@article.id}" #redirect back to articles index page
  end

  #destroy
  delete '/articles/:id' do
    Article.destroy(params[:id]) #define article to delete
    redirect '/articles' #redirect back to articles index page
  end

end
