require 'sinatra/base'
require_relative './lib/bookmarks.rb'
require 'pg'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  delete '/bookmarks/:id' do 
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do 
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get 'bookmarks/:id/edit' do 
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'

  run! if app_file == $0
end
