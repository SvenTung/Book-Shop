require_relative '../models/author'

#index
get '/authors' do
  @authors = Author.all
  erb(:"authors/index")
end

#index
get '/authors/A-Z' do
  @authors = Author.all_alphabetically
  erb(:"authors/A-Z")
end

#new
get '/authors/new' do
  erb(:"authors/new")
end

#show
get '/authors/:id' do
  id = params[:id].to_i()
  @author = Author.find_by_id(id)
  @books = @author.find_books
  erb(:"authors/show")
end

#delete check
get '/authors/:id/delete' do
  id = params[:id].to_i()
  @author = author.find_by_id(id)
  erb(:"authors/delete")
end

#edit
get '/author/:id/edit' do
  id = params[:id].to_i()
  @author = Author.find_by_id(id)
  erb(:"authors/edit")
end

#create
post '/authors' do
  author = Author.new(params)
  author.save
  redirect "authors/#{author.id}"
end

#update
post 'authors/:id' do
  author = Author.new(params)
  author.update
  redirect "authors/#{params[:id]}"
end

#destory
post '/authors/:id/delete' do
  id = params[:id].to_i()
  author = Author.find_by_id(id)
  author.delete
  redirect('/authors')
end
