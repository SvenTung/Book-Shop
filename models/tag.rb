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

  def self.find_by_id(id)
    sql = 'SELECT * FROM tags WHERE id = $1'
    values = [id]
    tag = SqlRunner.run(sql, values).first
    return Tag.new(tag)
  end

  def get_books()
    sql = 'SELECT books.* FROM books INNER JOIN links ON links.book_id = books.id WHERE links.tag_id = $1'
    values = [@id]
    books_array = SqlRunner.run(sql, values)
    return Book.map_books(books_array)
  end

  def sort_books(category)
    if category == 'author'
      sql = 'SELECT books.* FROM books INNER JOIN links ON links.book_id = books.id INNER JOIN authors ON books.author_id = authors.id WHERE links.tag_id = $1 ORDER BY authors.name'
    else
      sql = 'SELECT books.* FROM books INNER JOIN links ON links.book_id = books.id WHERE links.tag_id = $1 ORDER BY ' + category
    end
    values = [@id]
    books_array = SqlRunner.run(sql, values)
    return Book.map_books(books_array)
  end

  def self.find_books(params)
    result = []
    tags_id = params.keys
    for tag_id in tags_id
      sql = 'SELECT books.* FROM books INNER JOIN links ON links.book_id = books.id WHERE links.tag_id = $1'
      values = [tag_id]
      books_array = SqlRunner.run(sql, values)
      books_array = Book.map_books(books_array)
      for book in books_array
        if result.include?(book) == false
          result.push(book)
        end
      end
    end
    return result.uniq
  end

  def count()
    return get_books().length
  end

  def self.get_tags(params)
    tag_array = []
    tags_id = params.keys
    for tag_id in tags_id
      tag_array.push(Tag.find_by_id(tag_id))
    end
    return tag_array
  end

end
