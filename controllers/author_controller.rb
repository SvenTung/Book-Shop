require_relative '../models/author'

#index
get '/authors' do
  @authors = Author.all
  erb(:"authors/index")
end

#show
get '/authors/:id' do
  id = params[:id].to_i()
  @author = Author.find_by_id(id)
  @books = @author.find_books
  erb(:"authors/show")
end

#new
get '/authors/new' do
  erb(:"authors/new")
end

#create
#edit
#update
#destory
