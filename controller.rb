require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./controllers/book_controller.rb')
require_relative('./controllers/author_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:home)
end
