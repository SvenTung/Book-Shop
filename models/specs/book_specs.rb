require 'minitest/autorun'
require_relative '../book'

class TestBook < Minitest::Test

  def setup
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
      assert_equal('Cirque Du Freak', @book1.title)
  end

  def test_
end
