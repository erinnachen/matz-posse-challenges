require 'minitest'
require 'enums'

class EnumsTest < Minitest::Test


  def test_any
    collection = [1, 2, 3, 4, 5]
    condition = Proc.new { |a| a > 6 }
    assert Enums.any?(collection, condition)
  end

end
