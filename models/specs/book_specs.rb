require 'minitest/autorun'
require_relative '../book'

class TestBook < Minitest::Test

  def setup
    @book1 = Book.new({
      'title' => 'Cirque Du Freak',
      'author_id' => 1,
      'description' => 'A horror novel that follows a young teenager called Darren and his encounter with a vampire at a freak show.',
      'stock' => 8,
      'buying_cost' => 899,
      'selling_price' => 1099,
      'picture_link' => ''
    })
  end

  def test_create
      assert_equal('Cirque Du Freak', @book1.title)
  end

  def test_can_read_details
    assert_equal('Cirque Du Freak', @book1.title)
    assert_equal(1,@book1.author_id)
    assert_equal('A horror novel that follows a young teenager called Darren and his encounter with a vampire at a freak show.',@book1.description)
    assert_equal(8,@book1.stock)
    assert_equal(899,@book1.buying_cost)
    assert_equal(1099,@book1.selling_price)
    assert_equal('',@book1.picture_link)
  end

  def test_can_alter_title
    @book1.title = 'The Freak Circus'
    assert_equal('The Freak Circus', @book1.title)
  end

  def test_can_alter_description
    @book1.description = 'A horror novel by Darren Shan that follows a young teenager called Darren and his encounter with a vampire at a freak show.'
    assert_equal('A horror novel by Darren Shan that follows a young teenager called Darren and his encounter with a vampire at a freak show.',@book1.description)
  end

  def test_can_buy
    @book1.buy_book(2)
    assert_equal(10, @book1.stock)
  end

  def test_can_sell
    @book1.sell_book(2)
    assert_equal(6, @book1.stock)
  end

end
