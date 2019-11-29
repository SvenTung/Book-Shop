require_relative '../db/sql_runner'
class Author

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def map_authors(authors_array)
    return authors_array.map{|author_hash| Author.new(author_hash)}
  end

  def save()
    sql = 'INSERT INTO authors name VALUES $1 RETURNING id'
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
end
