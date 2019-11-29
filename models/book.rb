require_relative '../db/sql_runner'

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

end
