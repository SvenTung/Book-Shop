require_relative '../models/book'
require_relative '../models/author'

#index
get '/books' do
  @books = Book.all
  erb(:"books/index")
end

get '/books/table' do
  @books = Book.all
  erb(:"books/index_table")
end

#new
get '/books/new' do
  @authors = Author.all
  erb(:"books/new")
end

#show
get '/books/:id' do
  id = params[:id].to_i()
  @books = Book.find_by_id(id)
  erb(:"books/show")
end



#create
#edit
#update
#destory
