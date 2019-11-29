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
  end
end
