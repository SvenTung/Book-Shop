require_relative '../models/book'
require_relative '../models/author'

#index
get '/books' do
  @books = Book.all
  erb(:"books/index")
end

#index_table
get '/books/table' do
  @books = Book.all
  erb(:"books/index_table")
end

#index-alphabetically
get '/books/A-Z' do
  @books = Book.all_alphabetically
  erb(:"books/A-Z/index")
end

#index-alphabetically
get '/books/table/A-Z' do
  @books = Book.all_alphabetically
  erb(:"books/A-Z/index_table")
end

#new
get '/books/new' do
  @authors = Author.all
  @genres = ["Adventure", "Adult", "Children", "Drama", "Fairytale",  "Fantasy", "Horror", "Mystery", "Romance", "Science fiction", "Young"]
  erb(:"books/new")
end

# buy book
get '/books/buy' do
  erb(:"books/buy")
end

post '/books/buy' do
  quantity = params['quantity']
  book = Book.find_by_title(params['title'])
  book.buy_book(quantity)
  redirect "books/#{book.id}"
end

# sell book

get '/books/sell' do
  erb(:"books/sell")
end

post '/books/sell' do
  quantity = params['quantity']
  book = Book.find_by_title(params['title'])
  book.sell_book(quantity)
  redirect "books/#{book.id}"
end

#show
get '/books/:id' do
  id = params[:id].to_i()
  @book = Book.find_by_id(id)
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
  @genres = ["Adventure", "Adult", "Children", "Drama", "Fairytale",  "Fantasy", "Horror", "Mystery", "Romance", "Science fiction", "Young"]
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
