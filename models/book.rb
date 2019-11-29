require_relative '../db/sql_runner'
require_relative './author'

class Book

  attr_reader :id, :author_id
  attr_accessor :title, :description, :stock, :buying_cost, :selling_price, :pic_link

  def initialize(details)
    @id = details['id'].to_i
    @title = details['title']
    @author_id = details['author_id'].to_i
    @description = details['description']
    @stock = details['stock'].to_i
    @buying_cost = details['buying_cost'].to_f
    @selling_price = details['selling_price'].to_f
    @pic_link = details['pic_link']
  end

  def self.map_books(books_array)
    return books_array.map{|book_hash| Book.new(book_hash)}
  end

  def save()
    sql = 'INSERT INTO books name VALUES $1 RETURNING id'
    values = [@name]
    book = SqlRunner.run(sql, values).first()
    @id = book['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM books'
    books_array = SqlRunner.run(sql)
    map_books(books_array)
  end

  def self.delete_all
    sql = 'DELETE FROM books'
    SqlRunner.run(sql)
  end

  def update()
    sql = 'UPDATE books SET (title, author_id, description, stock, buying_cost, selling_price, pic_link) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8'
    values = [@title, @author_id, @description, @stock, @buying_cost, @selling_price, @pic_link, @id ]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM books WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_title(title)
    sql = 'SELECT * FROM books WHERE title = $1'
    values = [@title]
    book = SqlRunner.run(sql, values).first
    return Book.new(book)
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM books WHERE id = $1'
    values = [@id]
    book = SqlRunner.run(sql, values).first
    return Book.new(book)
  end

  def find_author
    sql = 'SELECT * FROM authors WHERE id = $1'
    values = [@author_id]
    author = SqlRunner.run(sql, values).first
    return Author.new(author)
  end

end
