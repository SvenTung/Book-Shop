require 'minitest/autorun'
require_relative '../shop'
require_relative '../book'

class TestShop < Minitest::Test

  def setup
    @shop1 = Shop.new({
      'name' => "Brandson's Bookshop",
      'address' => "97 High Street",
      'register_cash' => 75
    })

    @book1 = Book.new({
      'title' => 'Cirque Du Freak',
      'author_id' => 1,
      'description' => 'A horror novel that follows a young teenager called Darren and his encounter with a vampire at a freak show.',
      'stock' => 8,
      'buying_cost' => 8.99,
      'selling_price' => 10.99,
      'pic_link' => ''
    })
  end

  def test_create
    assert_equal("Brandson's Bookshop", @shop1.name)
  end

  def test_sell
    @shop1.sell(@book1, 2)
    assert_equal(6, @book1.stock)
    assert_equal(96.98, @shop1.register_cash)
  end

  def test_sell_not_enough_books
    @shop1.sell(@book1, 10)
    assert_equal(8, @book1.stock)
    assert_equal(75, @shop1.register_cash)
  end

  def test_buy
    @shop1.buy(@book1, 4)
    assert_equal(12, @book1.stock)
    assert_equal(39.04, @shop1.register_cash)
  end

  def test_buy_not_enough_cash
    @shop1.buy(@book1, 10)
    assert_equal(8, @book1.stock)
    assert_equal(75, @shop1.register_cash)
  end
end
