require_relative './models/author'
require_relative './models/book'
require 'pry'

Book.delete_all
Author.delete_all

author1 = Author.new({
  'name' => 'Darren Shan'
})

author1.save

author2 = Author.new({
  'name' => 'Garth Nix'
})

author2.save

book1 = Book.new({
  'title' => 'Cirque Du Freak',
  'author_id' => author1.id,
  'genre' => 'Horror',
  'description' => 'A horror novel that follows a young teenager called Darren and his encounter with a vampire at a freak show.',
  'stock' => 8,
  'buying_cost' => 899,
  'selling_price' => 1099,
  'picture_link' => ''
})

book1.save

book2 = Book.new({
  'title' => "The Vampire's Assistant",
  'author_id' => author1.id,
  'genre' => 'Horror',
  'description' => 'Darren now a half-vampire finds himself in the world of the supernatural. Follow him and his adventures with Mr Crepsley as he comes to term with what he is now.',
  'stock' => 4,
  'buying_cost' => 999,
  'selling_price' => 1199,
  'picture_link' => ''
  })

book2.save

book3 = Book.new({
  'title' => 'Mister Monday',
  'author_id' => author2.id,
  'genre' => 'Fantasy',
  'description' => 'This novel follows Arthur Penhaligon, a young teenager who receives a key and enters another world filled with other beings and enemies that seek to steal back the key.',
  'stock' => 7,
  'buying_cost' => 799,
  'selling_price' => 849,
  'picture_link' => ''
})

book3.save

binding.pry
nil
