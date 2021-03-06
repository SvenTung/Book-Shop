require_relative '../models/book'
require_relative '../models/author'
require_relative '../models/tag'
require_relative '../models/link'
require 'pry'

#index
get '/books' do
  @books = Book.all
  erb(:"books/index")
end

#index ascending sort
get '/books/:category/A-Z' do
  @books = Book.sort(params[:category])
  erb(:"books/index")
end

#index descending sort
get '/books/:category/Z-A' do
  @books = Book.sort(params[:category]).reverse
  erb(:"books/index")
end

#new
get '/books/new' do
  @authors = Author.all
  @genres = ["Adventure", "Drama", "Detective", "Fairytale",  "Fantasy", "Horror", "Mystery", "Novella", "Romance", "Science fiction"]
  erb(:"books/new")
end

# buy book
get '/books/buy' do
  @books = Book.all
  erb(:"books/buy/buy")
end

#post route for buy book
post '/books/buy' do
  @quantity = params[:quantity].to_i
  @book = Book.find_by_title(params[:title])
  @book.buy_book(@quantity)
  erb(:"books/buy/confirmation")
end

# sell book
get '/books/sell' do
  @books= Book.all
  erb(:"books/sell/sell")
end

# post route for sell book
post '/books/sell' do
  @quantity = params[:quantity].to_i
  @book = Book.find_by_title(params[:title])
  (@book.sell_book(@quantity))
  erb(:"books/sell/confirmation")
end

#show
get '/books/:id' do
  id = params[:id].to_i()
  @book = Book.find_by_id(id)
  @tags = @book.get_tags
  erb(:"books/show")
end

#delete check
get '/books/:id/delete' do
  id = params[:id].to_i()
  @book = Book.find_by_id(id)
  erb(:"books/delete")
end

#edit
get '/books/:id/edit' do
  id = params[:id].to_i()
  @book = Book.find_by_id(id)
  @authors = Author.all
  @genres = ["Adventure", "Drama", "Detective", "Fairytale",  "Fantasy", "Horror", "Mystery", "Novella", "Romance", "Science fiction"]
  erb(:"books/edit")
end

#create
post '/books' do
  book = Book.new(params)
  book.save
  redirect ("/books/#{book.id}")
end

#update
post '/books/:id' do
  book = Book.new(params)
  book.update
  redirect ("books/#{params[:id]}")
end

#destroy
post '/books/:id/delete' do
  id = params[:id].to_i()
  book = Book.find_by_id(id)
  book.delete
  redirect('/books')
end
