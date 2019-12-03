require_relative '../db/sql_runner'

class Tag

  attr_reader :id, :tag

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @tag = details['tag']
  end

  def self.map_tags(tags_array)
    return tags_array.map{|tag_hash| Tag.new(tag_hash)}
  end

  def save()
    sql = 'INSERT INTO tags (tag) VALUES ($1) RETURNING id'
    values = [@tag]
    book = SqlRunner.run(sql, values).first()
    @id = book['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM tags ORDER BY id'
    tags_array = SqlRunner.run(sql)
    return map_tags(tags_array)
  end

  def self.delete_all
    sql = 'DELETE FROM tags'
    SqlRunner.run(sql)
  end

  def update()
    sql = 'UPDATE tags SET (tag) = ($1) WHERE id = $2'
    values = [@tag, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM tags WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def get_books()
    sql = 'SELECT books.* FROM books INNER JOIN links ON links.book_id = books.id WHERE links.tag_id = $1'
    values = [@id]
    books_array = SqlRunner.run(sql, values)
    return Book.map_tags(tags_array)
  end

end
