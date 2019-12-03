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

#display search
post '/tags/display' do
  @books = Tag.find_books(params)
  erb(:"books/index")
end
