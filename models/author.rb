require_relative '../db/sql_runner'
require_relative './book'

class Author

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def self.map_authors(authors_array)
    return authors_array.map{|author_hash| Author.new(author_hash)}
  end

  def save()
    sql = 'INSERT INTO authors (name) VALUES ($1) RETURNING id'
    values = [@name]
    author = SqlRunner.run(sql, values).first()
    @id = author['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM authors'
    authors_array = SqlRunner.run(sql)
    map_authors(authors_array)
  end

  def self.delete_all
    sql = 'DELETE FROM authors'
    SqlRunner.run(sql)
  end

  def update()
    sql = 'UPDATE authors SET name = $1 WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM authors WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_name(name)
    sql = 'SELECT * FROM authors WHERE name = $1'
    values = [@name]
    author = SqlRunner.run(sql, values).first
    return Author.new(author)
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM authors WHERE id = $1'
    values = [@id]
    author = SqlRunner.run(sql, values).first
    return Author.new(author)
  end

  def find_books
    sql = 'SELECT * FROM books WHERE author_id = $1'
    values = [@id]
    books_array = SqlRunner.run(sql, values)
    return Book.map_books(books_array)
  end

end
