require_relative '../models/book'
require_relative '../models/author'

#index
get '/books' do
  @books = Book.all
  erb(:"books/index")
end

#index sort by title
get '/books/title/A-Z' do
  @books = Book.sort_by_title
  erb(:"books/index")
end

#index reverse sort by title
get '/books/title/Z-A' do
  @books = Book.sort_by_title.reverse
  erb(:"books/index")
end

#index sort by author
get '/books/author/A-Z' do
  @books = Book.sort_by_author
  erb(:"books/index")
end

#index reverse sort by author
get '/books/author/Z-A' do
  @books = Book.sort_by_author.reverse
  erb(:"books/index")
end

#index sort by genre
get '/books/genre/A-Z' do
  @books = Book.sort_by_genre
  erb(:"books/index")
end

#index reverse sort by genre
get '/books/genre/Z-A' do
  @books = Book.sort_by_genre.reverse
  erb(:"books/index")
end

#index sort by stock
get '/books/stock/A-Z' do
  @books = Book.sort_by_stock
  erb(:"books/index")
end

#index reverse sort by stock
get '/books/stock/Z-A' do
  @books = Book.sort_by_stock.reverse
  erb(:"books/index")
end

#new
get '/books/new' do
  @authors = Author.all
  @genres = ["Adventure", "Adult", "Children", "Drama", "Fairytale",  "Fantasy", "Horror", "Mystery", "Romance", "Science fiction", "Young"]
  erb(:"books/new")
end

# buy book
get '/books/buy' do
  @books = Book.all
  erb(:"books/buy/buy")
end

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

post '/books/sell' do
  @quantity = params[:quantity].to_i
  @book = Book.find_by_title(params[:title])
  @book.sell_book(@quantity)
  erb(:"books/sell/confirmation")
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
