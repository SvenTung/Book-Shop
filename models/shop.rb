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

  def sell(item, amount_sold)
    if item.stock >= amount_sold
      item.stock -= amount_sold
      # book.update
      @register_cash += (amount_sold * item.selling_price)
    else
      puts ("Not enough left in stock to be sold")
    end
  end

  def buy(item, amount_bought)
    if @register_cash >= (item.buying_cost * amount_bought)
      item.stock += amount_bought
      @register_cash -= (item.buying_cost * amount_bought)
    else
      puts ("Not enough cash left in register to buy that")
    end
  end

end
