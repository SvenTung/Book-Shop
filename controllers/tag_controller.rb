require_relative '../models/book'
require_relative '../models/author'
require_relative '../models/tag'
require_relative '../models/link'

#adding tags to book
get '/tags/:id/add' do
  @book = Book.find_by_id(params[:id])
  @tags = Tag.all
  erb(:"tags/add")
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
  tags = params[:tags]
  @books = Tags.find_books(tags)
  erb(:"tags/display")
end
