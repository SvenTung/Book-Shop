require_relative '../models/book'

#index
get '/books' do
  @books = Book.all
  erb(:"books/index")
end

#show
get '/books/:id' do
  id = params[:id].to_i()
  @book = Book.find_by_id(id)
  erb(:"books/show")
end

#new
get '/books/new' do
  @authors = Author.all
  erb(:"books/new")
end

#create
#edit
#update
#destory
