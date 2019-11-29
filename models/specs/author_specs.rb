require 'minitest/autorun'
require_relative '../author'

class TestAuthor < Minitest::Test

  def test_create
    author1 = Author.new({
      'name' => 'Darren Shan'
    })
    assert_equal('Darren Shan', author1.name)
  end

end
