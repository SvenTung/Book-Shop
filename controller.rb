require('sinatra')
require('sinatra/contrib/all')
require('pry')
also_reload('./models/*')

get '/' do
  erb(:home)
end
