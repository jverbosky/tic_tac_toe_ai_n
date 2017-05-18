# be sure to use the unit test versions of attr_ in win.rb
# - attr_reader in /game/win.rb

require "minitest/autorun"
require_relative "../game/win.rb"

class TestBoard < Minitest::Test

  def test_1_update_board_3x3
    board = ["", "X", "", "", "O", "", "", "X", ""]
    win = Win.new(3)
    win.update_board(board)
    result = win.game_board
    assert_equal(board, result)
  end

  def test_2_update_board_4x4
    board = ["", "X", "", "O", "", "", "", "X", "", "", "O", "", "", "X", "", ""]
    win = Win.new(4)
    win.update_board(board)
    result = win.game_board
    assert_equal(board, result)
  end

  def test_3_update_board_5x5
    board = ["", "X", "", "", "", "O", "", "", "", "X", "", "", "", "O", "", "", "", "X", "", "", "X", "", "O", "", ""]
    win = Win.new(5)
    win.update_board(board)
    result = win.game_board
    assert_equal(board, result)
  end

  def test_4_update_board_6x6
    board = ["", "X", "", "X", "", "O", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", ""]
    win = Win.new(6)
    win.update_board(board)
    result = win.game_board
    assert_equal(board, result)
  end

  def test_5_verify_all_spots_full_3x3
    board = ["X", "O", "X", "X", "O", "O", "O", "X", "X"]
    win = Win.new(3)
    win.update_board(board)
    result = win.board_full?
    assert_equal(true, result)
  end

  def test_6_verify_all_spots_full_4x4
    board = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O"]
    win = Win.new(4)
    win.update_board(board)
    result = win.board_full?
    assert_equal(true, result)
  end

  def test_7_verify_all_spots_full_5x5
    board = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X"]
    win = Win.new(5)
    win.update_board(board)
    result = win.board_full?
    assert_equal(true, result)
  end

  def test_8_verify_all_spots_full_6x6
    board = ["X", "O", "X", "X", "O", "O", "O", "X", "X"]
    win = Win.new(6)
    win.update_board(board)
    result = win.board_full?
    assert_equal(true, result)
  end

  def test_9_verify_board_almost_full_3x3
    board = ["X", "O", "X", "X", "O", "O", "O", "X", ""]
    win = Win.new(3)
    win.update_board(board)
    result = win.board_full?
    assert_equal(false, result)
  end

  def test_10_verify_board_almost_full_4x4
    board = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", ""]
    win = Win.new(4)
    win.update_board(board)
    result = win.board_full?
    assert_equal(false, result)
  end

  def test_11_verify_board_almost_full_5x5
    board = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", ""]
    win = Win.new(5)
    win.update_board(board)
    result = win.board_full?
    assert_equal(false, result)
  end

  def test_12_verify_board_almost_full_6x6
    board = ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", ""]
    win = Win.new(6)
    win.update_board(board)
    result = win.board_full?
    assert_equal(false, result)
  end

  def test_13_get_board_indexes_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal(board_indexes, result)
  end

  def test_14_get_board_indexes_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    assert_equal(board_indexes, result)
  end

  def test_15_get_board_indexes_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    assert_equal(board_indexes, result)
  end

  def test_16_get_board_indexes_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
    assert_equal(board_indexes, result)
  end

  def test_17_get_horizontal_winning_positions_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_h_wins(win.get_board_indexes)
    horizontal_wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    assert_equal(horizontal_wins, result)
  end

  def test_18_get_horizontal_winning_positions_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_h_wins(win.get_board_indexes)
    horizontal_wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]]
    assert_equal(horizontal_wins, result)
  end

  def test_19_get_horizontal_winning_positions_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_h_wins(win.get_board_indexes)
    horizontal_wins = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24]]
    assert_equal(horizontal_wins, result)
  end

  def test_20_get_horizontal_winning_positions_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_h_wins(win.get_board_indexes)
    horizontal_wins = [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35]]
    assert_equal(horizontal_wins, result)
  end

  def test_21_get_vertical_winning_positions_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_v_wins(win.get_board_indexes)
    vertical_wins = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    assert_equal(vertical_wins, result)
  end

  def test_22_get_vertical_winning_positions_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_v_wins(win.get_board_indexes)
    vertical_wins = [[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]]
    assert_equal(vertical_wins, result)
  end

  def test_23_get_vertical_winning_positions_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_v_wins(win.get_board_indexes)
    vertical_wins = [[0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24]]
    assert_equal(vertical_wins, result)
  end

  def test_24_get_vertical_winning_positions_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_v_wins(win.get_board_indexes)
    vertical_wins = [[0, 6, 12, 18, 24, 30], [1, 7, 13, 19, 25, 31], [2, 8, 14, 20, 26, 32], [3, 9, 15, 21, 27, 33], [4, 10, 16, 22, 28, 34], [5, 11, 17, 23, 29, 35]]
    assert_equal(vertical_wins, result)
  end

  def test_25_get_top_left_diagonal_winning_positions_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_1_win
    diagonal_1_win = [0, 4, 8]
    assert_equal(diagonal_1_win, result)
  end

  def test_26_get_top_left_diagonal_winning_positions_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_1_win
    diagonal_1_win = [0, 5, 10, 15]
    assert_equal(diagonal_1_win, result)
  end

  def test_27_get_top_left_diagonal_winning_positions_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_1_win
    diagonal_1_win = [0, 6, 12, 18, 24]
    assert_equal(diagonal_1_win, result)
  end

  def test_28_get_top_left_diagonal_winning_positions_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_1_win
    diagonal_1_win = [0, 7, 14, 21, 28, 35]
    assert_equal(diagonal_1_win, result)
  end

  def test_29_get_top_right_diagonal_winning_positions_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_2_win
    diagonal_2_win = [2, 4, 6]
    assert_equal(diagonal_2_win, result)
  end

  def test_30_get_top_right_diagonal_winning_positions_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_2_win
    diagonal_2_win = [3, 6, 9, 12]
    assert_equal(diagonal_2_win, result)
  end

  def test_31_get_top_right_diagonal_winning_positions_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_2_win
    diagonal_2_win = [4, 8, 12, 16, 20]
    assert_equal(diagonal_2_win, result)
  end

  def test_32_get_top_right_diagonal_winning_positions_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_2_win
    diagonal_2_win = [5, 10, 15, 20, 25, 30]
    assert_equal(diagonal_2_win, result)
  end

  def test_33_get_diagonal_winning_positions_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_wins
    diagonal_wins = [[0, 4, 8], [2, 4, 6]]
    assert_equal(diagonal_wins, result)
  end

  def test_34_get_diagonal_winning_positions_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_wins
    diagonal_wins = [[0, 5, 10, 15], [3, 6, 9, 12]]
    assert_equal(diagonal_wins, result)
  end

  def test_35_get_diagonal_winning_positions_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_wins
    diagonal_wins = [[0, 6, 12, 18, 24], [4, 8, 12, 16, 20]]
    assert_equal(diagonal_wins, result)
  end  

  def test_36_get_diagonal_winning_positions_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    result = win.get_d_wins
    diagonal_wins = [[0, 7, 14, 21, 28, 35], [5, 10, 15, 20, 25, 30]]
    assert_equal(diagonal_wins, result)
  end

  def test_37_populate_wins_3x3
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.wins
    all_wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    assert_equal(all_wins, result)
  end

  def test_38_populate_wins_4x4
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.wins
    all_wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
    assert_equal(all_wins, result)
  end

  def test_39_populate_wins_5x5
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.wins
    all_wins = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [0, 6, 12, 18, 24], [4, 8, 12, 16, 20]]
    assert_equal(all_wins, result)
  end

  def test_40_populate_wins_6x6
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.wins
    all_wins = [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35], [0, 6, 12, 18, 24, 30], [1, 7, 13, 19, 25, 31], [2, 8, 14, 20, 26, 32], [3, 9, 15, 21, 27, 33], [4, 10, 16, 22, 28, 34], [5, 11, 17, 23, 29, 35], [0, 7, 14, 21, 28, 35], [5, 10, 15, 20, 25, 30]]
    assert_equal(all_wins, result)
  end

  def test_41_verify_game_won_true_3x3
    positions = [0, 1, 4, 8]  # diagonal 1 win = [0, 4, 8]
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(true, result)
  end

  def test_42_verify_game_won_true_4x4
    positions = [0, 1, 3, 6, 9, 12]  # diagonal 2 win = [3, 6, 9, 12]
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(true, result)
  end

  def test_43_verify_game_won_true_5x5
    positions = [0, 1, 6, 11, 13, 16, 21, 24]  # vertical win = [1, 6, 11, 16, 21]
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(true, result)
  end

  def test_44_verify_game_won_true_6x6
    positions = [0, 9, 12, 13, 14, 15, 16, 17, 23, 26, 31, 35]  # horizontal win = [12, 13, 14, 15, 16, 17]
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(true, result)
  end

  def test_45_verify_game_won_false_3x3
    positions = [0, 1, 4]  # diagonal 1 win = [0, 4, 8]
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(false, result)
  end

  def test_46_verify_game_won_false_4x4
    positions = [0, 1, 3, 6, 9]  # diagonal 2 win = [3, 6, 9, 12]
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(false, result)
  end

  def test_47_verify_game_won_false_5x5
    positions = [0, 1, 6, 11, 13, 16, 24]  # vertical win = [1, 6, 11, 16, 21]
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(false, result)
  end

  def test_48_verify_game_won_false_6x6
    positions = [0, 9, 12, 13, 14, 15, 16, 23, 26, 31, 35]  # horizontal win = [12, 13, 14, 15, 16, 17]
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.get_win(positions)
    assert_equal(false, result)
  end

  def test_49_verify_get_winning_positions_3x3
    positions = [0, 1, 4, 8]  # diagonal 1 win = [0, 4, 8]
    size = 3
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    win.get_win(positions)
    result = win.win
    assert_equal([0, 4, 8], result)
  end

  def test_50_verify_get_winning_positions_4x4
    positions = [0, 1, 3, 6, 9, 12]  # diagonal 2 win = [3, 6, 9, 12]
    size = 4
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    win.get_win(positions)
    result = win.win
    assert_equal([3, 6, 9, 12], result)
  end

  def test_51_verify_get_winning_positions_5x5
    positions = [0, 1, 6, 11, 13, 16, 21, 24]  # vertical win = [1, 6, 11, 16, 21]
    size = 5
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    win.get_win(positions)
    result = win.win
    assert_equal([1, 6, 11, 16, 21], result)
  end

  def test_52_verify_get_winning_positions_6x6
    positions = [0, 9, 12, 13, 14, 15, 16, 17, 23, 26, 31, 35]  # horizontal win = [12, 13, 14, 15, 16, 17]
    size = 6
    board = Array.new(size*size) { |i| "" }
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    win.get_win(positions)
    result = win.win
    assert_equal([12, 13, 14, 15, 16, 17], result)
  end

  def test_53_verify_X_won_false_3x3
    size = 3
    board = ["X", "", "", "", "O", "", "", "", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(false, result)
  end

  def test_54_verify_X_won_false_4x4
    size = 4
    board = ["", "X", "", "O", "", "", "", "X", "", "", "O", "", "", "X", "", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(false, result)
  end

  def test_55_verify_X_won_false_5x5
    size = 5
    board = ["", "X", "", "", "", "O", "", "", "", "X", "", "", "", "O", "", "", "", "X", "", "", "X", "", "O", "", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(false, result)
  end

  def test_56_verify_X_won_false_6x6
    size = 6
    board = ["", "X", "", "X", "", "O", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(false, result)
  end

  def test_57_verify_X_won_true_3x3
    size = 3
    board = ["X", "O", "", "", "O", "O", "X", "X", "X"]
    # note: horizontal win = [6, 7, 8]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(true, result)
  end

  def test_58_verify_X_won_true_4x4
    size = 4
    board = ["X", "X", "O", "O", "X", "O", "", "X", "X", "O", "O", "", "X", "", "", "O"]
    # note: vertical win = [0, 4, 8, 12]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(true, result)
  end

  def test_59_verify_X_won_true_5x5
    size = 5
    board = ["X", "X", "O", "O", "", "O", "X", "", "O", "X", "", "", "X", "O", "", "", "", "X", "X", "O", "X", "O", "O", "O", "X"]
    # note: diagonal 1 win = [0, 6, 12, 18, 24]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(true, result)
  end

  def test_60_verify_X_won_true_6x6
    size = 6
    board = ["O", "X", "O", "X", "O", "X", "O", "", "", "X", "X", "", "", "", "O", "X", "", "", "", "X", "X", "", "", "", "O", "X", "", "", "O", "X", "X", "", "O", "", "O", "O"]
    # note: diagonal 2 win = [5, 10, 15, 20, 25, 30]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.x_won?
    assert_equal(true, result)
  end

  def test_61_verify_O_won_false_3x3
    size = 3
    board = ["X", "", "", "", "O", "", "", "", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(false, result)
  end

  def test_62_verify_O_won_false_4x4
    size = 4
    board = ["", "X", "", "O", "", "", "", "X", "", "", "O", "", "", "X", "", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(false, result)
  end

  def test_63_verify_O_won_false_5x5
    size = 5
    board = ["", "X", "", "", "", "O", "", "", "", "X", "", "", "", "O", "", "", "", "X", "", "", "X", "", "O", "", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(false, result)
  end

  def test_64_verify_O_won_false_6x6
    size = 6
    board = ["", "X", "", "X", "", "O", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", ""]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(false, result)
  end

  def test_65_verify_O_won_true_3x3
    size = 3
    board = ["X", "", "", "O", "O", "O", "X", "", "X"]
    # note: horizontal win = [3, 4, 5]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(true, result)
  end

  def test_66_verify_O_won_true_4x4
    size = 4
    board = ["X", "X", "O", "O", "", "O", "O", "X", "", "", "O", "", "X", "X", "O", "X"]
    # note: vertical win = [2, 6, 10, 14]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(true, result)
  end

  def test_67_verify_O_won_true_5x5
    size = 5
    board = ["O", "X", "X", "X", "X", "O", "O", "X", "", "X", "", "", "O", "O", "", "", "", "X", "O", "", "X", "", "O", "", "O"]
    # note: diagonal 1 win = [0, 6, 12, 18, 24]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(true, result)
  end

  def test_68_verify_O_won_true_6x6
    size = 6
    board = ["X", "X", "", "X", "", "O", "X", "", "", "X", "O", "", "", "", "O", "O", "", "X", "", "X", "O", "", "", "", "O", "O", "", "", "", "X", "O", "", "", "", "O", "X"]
    # note: diagonal 2 win = [5, 10, 15, 20, 25, 30]
    win = Win.new(size)
    win.update_board(board)
    win.populate_wins
    result = win.o_won?
    assert_equal(true, result)
  end

end