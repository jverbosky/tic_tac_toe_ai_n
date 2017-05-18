# be sure to use the unit test version of attr_ in board.rb
# - attr_accessor in /board/board.rb

# assert_equal()
# what you expect on left, result on right

require "minitest/autorun"
require_relative "../board/board.rb"

class TestBoard < Minitest::Test

  def test_1_verify_board_array_exists_3_by_3
    board = Board.new(3)
    result = ["", "", "", "", "", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_2_verify_board_array_exists_4_by_4
    board = Board.new(4)
    result = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_3_verify_board_array_exists_27_by_27
    board = Board.new(27)
    result = board.game_board.count
    assert_equal(729, result) 
  end

  def test_4_verify_spot_already_taken_3_by_3
    board = Board.new(3)
    board.game_board = ["X", "", "", "", "O", "", "", "", ""]
    result = board.position_open?(4)
    assert_equal(false, result)
  end

  def test_5_verify_spot_already_taken_4_by_4
    board = Board.new(4)
    board.game_board = ["X", "", "", "", "O", "", "", "", "", "", "", "", "", "", "", ""]
    result = board.position_open?(4)
    assert_equal(false, result)
  end

  def test_6_verify_spot_is_open_3_by_3
    board = Board.new(3)
    board.game_board = ["X", "", "", "", "O", "", "", "", ""]
    result = board.position_open?(3)
    assert_equal(true, result)
  end

  def test_7_verify_spot_is_open_4_by_4
    board = Board.new(4)
    board.game_board = ["X", "", "", "", "O", "", "", "", "", "", "", "", "", "", "", ""]
    result = board.position_open?(3)
    assert_equal(true, result)
  end

  def test_8_verify_update_X_at_1st_3_by_3
    board = Board.new(3)
    board.set_position(0, "X")
    result = ["X", "", "", "", "", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_9_verify_update_X_at_1st_4_by_4
    board = Board.new(4)
    board.set_position(0, "X")
    result = ["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_10_verify_update_O_at_5th_X_at_1st_3_by_3
    board = Board.new(3)
    board.set_position(0, "X")
    board.set_position(4, "O")
    result = ["X", "", "", "", "O", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_11_verify_update_O_at_5th_X_at_1st_4_by_4
    board = Board.new(4)
    board.set_position(0, "X")
    board.set_position(4, "O")
    result = ["X", "", "", "", "O", "", "", "", "", "", "", "", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_12_verify_update_X_at_8th_O_at_5th_X_at_1st_3_by_3
    board = Board.new(3)
    board.game_board = ["X", "", "", "", "O", "", "", "", ""]
    board.set_position(7, "X")
    result = ["X", "", "", "", "O", "", "", "X", ""]
    assert_equal(board.game_board, result)
  end

  def test_13_verify_update_X_at_8th_O_at_5th_X_at_1st_4_by_4
    board = Board.new(4)
    board.game_board = ["X", "", "", "", "O", "", "", "", "", "", "", "", "", "", "", ""]
    board.set_position(7, "X")
    result = ["X", "", "", "", "O", "", "", "X", "", "", "", "", "", "", "", ""]
    assert_equal(board.game_board, result)
  end

  def test_14_get_x_positions_3_by_3
    board = Board.new(3)
    board.game_board = ["X", "O", "", "X", "O", "O", "O", "X", "X"]
    result = board.get_x
    assert_equal([0, 3, 7, 8], result)
  end

  def test_15_get_x_positions_4_by_4
    board = Board.new(4)
    board.game_board = ["X", "O", "", "X", "O", "O", "O", "X", "X", "", "", "X", "O", "", "X", ""]
    result = board.get_x
    assert_equal([0, 3, 7, 8, 11, 14], result)
  end

  def test_16_get_o_positions_3_by_3
    board = Board.new(3)
    board.game_board = ["X", "O", "", "X", "O", "O", "O", "X", "X"]
    result = board.get_o
    assert_equal([1, 4, 5, 6], result)
  end

  def test_17_get_o_positions_4_by_4
    board = Board.new(4)
    board.game_board = ["X", "O", "", "X", "O", "O", "O", "X", "X", "", "", "X", "O", "O", "X", ""]
    result = board.get_o
    assert_equal([1, 4, 5, 6, 12, 13], result)
  end

end