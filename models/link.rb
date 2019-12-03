require_relative '../db/sql_runner'
require_relative './book'
require_relative './tag'

class Link

  attr_reader :id, :book_id, :tag_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @book_id = details['book_id'].to_i
    @tag_id = details['tag_id'].to_i
  end

  def self.map_links(links_array)
    return links_array.map{|link_hash| Link.new(link_hash)}
  end

  def save()
    sql = 'INSERT INTO links (book_id, tag_id) VALUES ($1, $2) RETURNING id'
    values = [@book_id, @tag_id]
    link = SqlRunner.run(sql, values).first()
    @id = link['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM links ORDER BY id'
    links_array = SqlRunner.run(sql)
    return map_links(links_array)
  end

  def self.delete_all
  sql = 'DELETE FROM links'
  SqlRunner.run(sql)
end

  def update()
    sql = 'UPDATE links SET (book_id, tag_id) = ($1, $2) WHERE id = $3'
    values = [@book_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM links WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_book_tags(book_id)
    sql = 'DELETE FROM links WHERE book_id = $1'
    values = [book_id]
    SqlRunner.run(sql, values)
  end

  def self.attach(params)
    book_id = params['id'].to_i
    Link.delete_book_tags(book_id)
    params.delete('id')
    tags_id = params.keys
    for tag_id in tags_id
      link = Link.new({
        'book_id' => book_id,
        'tag_id' => tag_id
        })
      link.save
    end
  end
end
