require_relative '../db/sql_runner'
require_relative './book'

class Shop

  attr_reader :id
  attr_accessor :name, :address, :register_cash
  
  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @address = details['address']
    @register_cash = details['register_cash'].to_i
  end

end
