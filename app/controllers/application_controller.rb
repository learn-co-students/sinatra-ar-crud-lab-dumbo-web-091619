require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # index will redirect to all instances of articles
    redirect to "/articles"
  end

  get '/articles' do
    # will read all of the articles we have
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    # Will read form for the user to create instances
    # and will store the information in a params {}:
    erb :new
  end

  post '/articles' do
    # NEW
    # This creates the instances to be added to articles list
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    # Show the particular article
    @article = Article.find(params[:id])
    erb :show
  end


  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit


  end

  patch '/articles/:id' do

    @article = Article.find(params[:id])
    @article.update(params[:article])
    # binding.pry
    redirect to "/articles/#{ @article.id }"
  end

  #destroy
delete "/articles/:id" do
  Article.destroy(params[:id])
  redirect to "/articles"
end

end
