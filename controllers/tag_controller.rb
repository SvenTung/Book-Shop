require_relative '../models/book'
require_relative '../models/author'
require_relative '../models/tag'
require_relative '../models/link'

#index
get '/tags/index' do
  @tags = Tag.all
  erb(:"tags/index")
end

#new
get '/tags/new' do
  @tags = Tag.all
  erb(:"tags/new")
end

#create
post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect ("/tags/index")
end

#editing book tags
get '/tags/:id/edit' do
  @book = Book.find_by_id(params[:id])
  @tags = Tag.all
  erb(:"tags/edit")
end

#attaching them to a specific book
post '/tags/:id/attach' do
  id = params['id']
  Link.attach(params)
  redirect("books/#{id}")
end

#search tags
get '/tags/search' do
  @tags = Tag.all
  erb(:"tags/search")
end

#display one tag
get '/tags/display/:id' do
  @tag = Tag.find_by_id(params[:id])
  @books = @tag.get_books()
  erb(:"books/display1")
end

#display sort
get '/tags/display/:id/:category/A-Z' do
  @tag = Tag.find_by_id(params[:id])
  @books = @tag.sort_books(params[:category])
  erb(:"books/display1")
end

#display sort reversed
get '/tags/display/:id/:category/Z-A' do
  @tag = Tag.find_by_id(params[:id])
  @books = @tag.sort_books(params[:category]).reverse
  erb(:"books/display1")
end

#display search
post '/tags/display' do
  @books = Tag.find_books(params)
  binding.pry
  @search = Tag.get_tags(params)
  erb(:"books/display")
end
