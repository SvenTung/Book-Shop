require_relative './models/author'
require_relative './models/book'
require_relative './models/tag'
require_relative './models/link'

require 'pry'

Book.delete_all
Author.delete_all
Tag.delete_all
Link.delete_all

author1 = Author.new({
  'name' => 'Darren Shan'
})
author1.save

author2 = Author.new({
  'name' => 'Garth Nix'
})
author2.save

author3 = Author.new({
  'name' => 'J.K. Rowling'
})
author3.save

author4 = Author.new({
  'name' => 'George RR Martin'
})
author4.save

author5 = Author.new({
  'name' => 'Agatha Christie'
})
author5.save

author6 = Author.new({
  'name' => 'Arthur Conan Doyle'
})
author6.save

author7 = Author.new({
  'name' => 'John Steinbeck'
})
author7.save

author8 = Author.new({
  'name' => 'Orson Scott Card'
})
author8.save

author9 = Author.new({
  'name' => 'Stephen King'
})
author9.save

author10 = Author.new({
  'name' => 'Eric Nylund'
})
author10.save

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

book4 = Book.new({
  'title' => "Harry Potter and The Philosopher's Stone",
  'author_id' => author3.id,
  'genre' => 'Fantasy',
  'description' => 'Harry Potter an orphan who stays with his relatives finds out that he is a wizard and enters a wizarding school called Hogwarts.',
  'stock' => 10,
  'buying_cost' => 899,
  'selling_price' => 949,
  'picture_link' => ''
})
book4.save

book5 = Book.new({
  'title' => 'A Game of Thrones',
  'author_id' => author4.id,
  'genre' => 'Fantasy',
  'description' => 'Many families and houses in Westeros seek political power through subterfuge and blackmail.',
  'stock' => 15,
  'buying_cost' => 1099,
  'selling_price' => 1299,
  'picture_link' => ''
})
book5.save

book6 = Book.new({
  'title' => 'Murder on the Orient Express',
  'author_id' => author5.id,
  'genre' => 'Mystery',
  'description' => 'Poiret, a famous detective, is on his way home to London on Orient Express when a murder happens on the train.',
  'stock' => 5,
  'buying_cost' => 699,
  'selling_price' => 799,
  'picture_link' => ''
})
book6.save

book7 = Book.new({
  'title' => 'A Study in Scarlett',
  'author_id' => author6.id,
  'genre' => 'Detective',
  'description' => 'The first book about Sherlock Holmes and his detective adventures with Dr. John Watson.',
  'stock' => 2,
  'buying_cost' => 1800,
  'selling_price' => 2000,
  'picture_link' => ''
})
book7.save

book8 = Book.new({
  'title' => 'Of Mice and Men',
  'author_id' => author7.id,
  'genre' => 'Novella',
  'description' => 'This novella follows George and Lennie and their travels to find work during The Great Depression.',
  'stock' => 6,
  'buying_cost' => 599,
  'selling_price' => 799,
  'picture_link' => ''
})
book8.save

book9 = Book.new({
  'title' => "Ender's Game",
  'author_id' => author8.id,
  'genre' => 'Science fiction',
  'description' => 'Set in a futuristic time-period where humans are at war with an insectoid species. Children, including the protagonist, are trained from a young age in war games.',
  'stock' => 0,
  'buying_cost' => 699,
  'selling_price' => 899,
  'picture_link' => ''
})
book9.save


book10 = Book.new({
  'title' => 'IT',
  'author_id' => author9.id,
  'genre' => 'Horror',
  'description' => 'This story follows 7 children in the town of Derry while they are terrorized by an evil entity known as Pennywise.',
  'stock' => 4,
  'buying_cost' => 999,
  'selling_price' => 1099,
  'picture_link' => ''
})
book10.save

book11 = Book.new({
  'title' => 'Halo: The Fall of Reach',
  'author_id' => author10.id,
  'genre' => 'Science Fiction',
  'description' => 'Set in a futuristic space-age setting John, the protagonist, is 1 of 150 children that possess a rare genetic marker that makes them ideal for a new super soldier program.',
  'stock' => 6,
  'buying_cost' => 999,
  'selling_price' => 1299,
  'picture_link' => ''
})
book11.save

tag1 = Tag.new({
  'tag' => 'Action'
})
tag1.save

tag2 = Tag.new({
  'tag' => 'Adventure'
})
tag2.save

tag3 = Tag.new({
  'tag' => 'Classic'
})
tag3.save

tag4 = Tag.new({
  'tag' => 'Coming of Age'
})
tag4.save

tag5 = Tag.new({
  'tag' => 'Detective'
})
tag5.save

tag6 = Tag.new({
  'tag' => 'Fairytale'
})
tag6.save

tag7 = Tag.new({
  'tag' => 'Fantasy'
})
tag7.save

tag8 = Tag.new({
  'tag' => 'Fiction'
})
tag8.save

tag9 = Tag.new({
  'tag' => 'Futuristic'
})
tag9.save

tag10 = Tag.new({
  'tag' => 'Historical'
})
tag10.save

tag11 = Tag.new({
  'tag' => 'Horror'
})
tag11.save

tag12 = Tag.new({
  'tag' => 'Mystery'
})
tag12.save

tag13 = Tag.new({
  'tag' => 'Non-fiction'
})
tag13.save

tag14 = Tag.new({
  'tag' => 'Novel'
})
tag14.save

tag15 = Tag.new({
  'tag' => 'Paranormal'
})
tag15.save

tag16 = Tag.new({
  'tag' => 'Romance'
})
tag16.save

tag17 = Tag.new({
  'tag' => 'Science Fiction'
})
tag17.save

tag18 = Tag.new({
  'tag' => 'Series'
})
tag18.save

tag19 = Tag.new({
  'tag' => 'Teen'
})
tag19.save

tag20 = Tag.new({
  'tag' => 'Thriller'
})
tag20.save

tag21 = Tag.new({
  'tag' => 'Young-adult'
})
tag21.save

link1 = Link.new({
  'book_id' => book1.id,
  'tag_id' => tag11.id
})
link1.save

link2 = Link.new({
  'book_id' => book1.id,
  'tag_id' => tag4.id
})
link2.save

link3 = Link.new({
  'book_id' => book1.id,
  'tag_id' => tag2.id
})
link3.save

binding.pry
nil
