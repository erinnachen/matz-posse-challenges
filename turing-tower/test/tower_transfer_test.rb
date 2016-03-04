require "minitest"
require "tower_transfer"

class TowerTransferTest < Minitest::Test
  def test_tower_transfers_one_disc_in_one_move
    tower = TowerTransfer.new(1)
    moves = tower.move_tower
    assert_equal 1, moves
    assert_equal [], tower.posts[1]
    assert_equal [], tower.posts[2]
    assert_equal [1], tower.posts[3]
  end

  def test_tower_transfers_two_discs_in_three_moves
    tower = TowerTransfer.new(2)
    moves = tower.move_tower
    assert_equal 3, moves
    assert_equal [], tower.posts[1]
    assert_equal [], tower.posts[2]
    assert_equal [2,1], tower.posts[3]
  end

  def test_tower_transfers_three_discs_in_seven_moves
    tower = TowerTransfer.new(3)
    moves = tower.move_tower
    assert_equal 7, moves
    assert_equal [], tower.posts[1]
    assert_equal [], tower.posts[2]
    assert_equal [3,2,1], tower.posts[3]
  end

  def test_tower_transfers_n_discs_in_2_to_the_n_minus_1_moves
    tower = TowerTransfer.new(8)
    moves = tower.move_tower
    assert_equal 255, moves
    assert_equal [], tower.posts[1]
    assert_equal [], tower.posts[2]
    assert_equal [8, 7, 6, 5, 4, 3, 2, 1], tower.posts[3]
  end
end
