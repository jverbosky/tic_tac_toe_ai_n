# be sure to use the unit test versions of attr_ in board.rb and game.rb
# - attr_accessor in board.rb
# - attr_reader in game.rb

require "minitest/autorun"
require_relative "../players/player_unb.rb"
require_relative "../game/game.rb"

class TestPlayerPerfectNS < Minitest::Test

  def test_1_round_1_X_takes_center
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(4, result)
  end

  def test_2_round_2_O_takes_center
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_3_round_2_X_took_center_O_takes_a_random_corner
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "", "X", "", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_4_round_2_X_took_edge_O_takes_center_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "X", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_5_round_2_X_took_edge_O_takes_center_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "X", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_6_round_3_perfect_O_took_center_X_takes_open_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_7_round_3_perfect_O_took_center_X_takes_open_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "O", "", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_8_round_3_perfect_O_took_center_X_takes_open_corner_v3
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "", "O", "", "X", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_9_round_3_perfect_O_took_center_X_takes_open_corner_v4
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "", "O", "", "", "", "X"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    corners = [0, 2, 6]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_10_round_3_O_took_edge_X_takes_center
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "", "", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(4, result)
  end

  def test_11_round_3_O_took_corner_X_takes_center_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_12_round_3_O_took_corner_X_takes_center_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_13_round_3_O_took_opposite_corner_X_takes_center_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "", "", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_14_round_3_O_took_opposite_corner_X_takes_center_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "", "", "O", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

  def test_15_round_4_perfect_X_took_opposite_corner_O_forces_block_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "", "", "", "X"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.edges.include? move
    assert_equal(true, result)
  end

  def test_16_round_4_perfect_X_took_opposite_corner_O_forces_block_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "O", "", "X", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.edges.include? move
    assert_equal(true, result)
  end

  def test_17_round_4_X_took_corner_and_adjacent_corner_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "", "O", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(1, result)
  end

  def test_18_round_4_X_took_corner_and_adjacent_corner_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "O", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(5, result)
  end

  def test_19_round_4_X_took_corner_and_adjacent_edge_O_blocks_at_adjacent_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "", "", "O", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_20_round_4_X_took_corner_and_adjacent_edge_O_blocks_at_adjacent_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "O", "X", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(8, result)
  end

  def test_21_round_4_X_took_corner_and_non_adjacent_edge_O_blocks_fork_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "", "", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_22_round_4_X_took_corner_and_non_adjacent_edge_O_blocks_fork_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "X", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_23_round_4_X_took_center_and_corner_O_blocks_at_opposite_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "", "X", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_24_round_4_X_took_center_and_corner_O_blocks_at_opposite_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "O", "", "X", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(0, result)
  end

  def test_25_round_4_X_took_center_and_corner_opposite_O_O_forces_block_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "", "", "X", "", "", "", "X"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    corners = [2, 6]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_26_round_4_X_took_center_and_corner_opposite_O_O_forces_block_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "X", "", "O", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    corners = [0, 8]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_27_round_4_X_took_center_and_edge_O_blocks_at_opposite_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "", "X", "X", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(5, result)
  end

  def test_28_round_4_X_took_center_and_edge_O_blocks_at_opposite_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "", "X", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(7, result)
  end

  def test_29_round_4_X_took_edge_and_opposite_edge_O_takes_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "X", "", "", "O", "", "", "X", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_30_round_4_X_took_edge_and_opposite_edge_O_takes_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "X", "O", "X", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_31_round_4_X_took_edge_and_adjacent_edge_O_takes_corner_between_X_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "X", "", "", "O", "X", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_32_round_4_X_took_edge_and_adjacent_edge_O_takes_corner_between_X_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "", "O", "X", "", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(8, result)
  end

  def test_33_round_5_perfect_O_took_edge_X_blocks_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "", "O", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(7, result)
  end

  def test_34_round_5_perfect_O_took_edge_X_blocks_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "O", "O", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(5, result)
  end

  def test_35_round_5_perfect_O_took_edge_X_blocks_v3
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "O", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(3, result)
  end

  def test_36_round_5_perfect_O_took_edge_X_blocks_v4
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "", "", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_37_round_5_O_took_center_after_corner_X_blocks_and_sets_2_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "", "O", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_38_round_5_O_took_edge_after_opposite_corner_X_makes_fork
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "", "", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_39_round_5_O_took_corner_after_center_X_block_and_sets_2_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "", "O", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(2, result)
  end

  def test_40_round_5_O_took_opposite_corner_and_adjacent_edge_X_block_and_sets_2_wins_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "X", "O", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(2, result)
  end

  def test_41_round_5_O_took_opposite_corner_and_adjacent_edge_X_block_and_sets_2_wins_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "X", "", "", "O", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_42_round_5_O_took_adjacent_corner_and_adjacent_edge_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "", "", "O", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(4, result)
  end

  def test_43_round_5_added_failsafe_logic_after_random_testing
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "", "", "", "O", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_44_round_5_merged_edge_logic_into_block_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "O", "O", "X", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(0, result)
  end

  def test_45_round_5_merged_edge_logic_into_block_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "O", "X", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(8, result)
  end

  def test_46_round_6_perfect_X_blocks_at_edge_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "", "O", "", "", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_47_round_6_perfect_X_blocks_at_edge_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "", "", "O", "", "", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_48_round_6_perfect_X_blocks_at_edge_O_blocks_at_corner_v3
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "O", "O", "X", "X", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(8, result)
  end

  def test_49_round_6_perfect_X_blocks_at_edge_O_blocks_at_corner_v4
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "X", "O", "O", "X", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(0, result)
  end

  def test_50_round_6_X_took_adjacent_corners_and_opposite_edge_O_forces_block_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "O", "", "", "X", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    edges = [3, 5]
    result = edges.include? move
    assert_equal(true, result)
  end

  def test_51_round_6_X_took_adjacent_corners_and_opposite_edge_O_forces_block_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "X", "O", "O", "", "", "X"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    edges = [1, 7]
    result = edges.include? move
    assert_equal(true, result)
  end

  def test_52_round_6_X_took_corner_adjacent_edge_and_adjacent_corner_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "", "O", "", "X", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(3, result)
  end

  def test_53_round_6_X_took_corner_adjacent_edge_and_adjacent_corner_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "", "O", "X", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(1, result)
  end

  def test_54_round_6_X_took_adjacent_edges_and_adjacent_corner_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "X", "O", "O", "", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_55_round_6_X_took_adjacent_edges_and_adjacent_corner_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "", "", "O", "X", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_56_round_6_X_took_corner_center_and_opposite_edge_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "X", "X", "", "O", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(5, result)
  end

  def test_57_round_6_X_took_corner_center_and_opposite_edge_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "O", "", "X", "", "X", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(7, result)
  end

  def test_58_round_6_X_took_corner_and_adjacent_edges_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "X", "X", "O", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(7, result)
  end

  def test_59_round_6_X_took_corner_and_adjacent_edges_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "X", "X", "", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(5, result)
  end

  def test_60_round_6_X_took_edge_adjacent_corner_and_center_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "", "X", "X", "O", "X", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_61_round_6_X_took_edge_adjacent_corner_and_center_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "X", "", "X", "", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_62_round_6_X_took_corner_adjacent_edge_and_opposite_edge_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "", "O", "", "", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_63_round_6_X_took_corner_adjacent_edge_and_opposite_edge_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "X", "O", "X", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_64_round_6_X_took_adjacent_edges_and_opposite_corner_O_takes_random_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "X", "O", "", "O", "X", "X", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    positions = [0, 8]
    result = positions.include? move
    assert_equal(true, result)
  end

  def test_65_round_6_X_took_adjacent_edges_and_opposite_corner_O_takes_random_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "O", "X", "", "X", "O"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    positions = [2, 6]
    result = positions.include? move
    assert_equal(true, result)
  end

  def test_66_round_7_O_blocks_at_m1_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "O", "O", "", "X", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(7, result)
  end

  def test_67_round_7_O_blocks_at_b2_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "", "O", "", "X", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(3, result)
  end

  def test_68_round_7_O_blocks_at_m1_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "O", "", "", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(4, result)
  end

  def test_69_round_7_O_blocks_at_m2_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "O", "", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(3, result)
  end

  def test_70_round_7_O_blocks_at_t2_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "O", "", "O", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(5, result)
  end

  def test_71_round_7_O_blocks_at_m3_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "", "O", "O", "O", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_72_round_7_X_blocks_O_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "", "O", "", "O", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(2, result)
  end

  def test_73_round_7_X_blocks_O_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "O", "O", "X", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_74_round_7_X_blocks_O_v3
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "X", "O", "O", "X", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(0, result)
  end

  def test_75_round_7_X_blocks_O_v4
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "X", "O", "O", "X", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(8, result)
  end

  def test_76_round_7_multiple_X_blocks_O
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "O", "", "X", "O", "X", "X", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    blocks = [2, 7, 8]
    result = blocks.include? move
    assert_equal(true, result)
  end

  def test_77_round_7_multiple_X_wins
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "", "O", "X", "O", "O", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    winners = [2, 7, 8]
    result = winners.include? move
    assert_equal(true, result)
  end

  def test_78_round_6_perfect_X_blocks_at_edge_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "O", "", "O", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(5, result)
  end

  def test_79_round_6_perfect_X_blocks_at_edge_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "", "O", "", "X", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(3, result)
  end

  def test_80_round_8_perfect_X_blocks_at_edge_O_blocks_at_corner_v3
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "O", "O", "X", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_81_round_8_perfect_X_blocks_at_corner_O_blocks_at_edge_v4
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "X", "O", "O", "X", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(7, result)
  end

  def test_82_round_8_X_blocked_at_edge_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "O", "O", "X", "", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(8, result)
  end

  def test_83_round_8_X_blocked_at_edge_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "X", "X", "X", "O", "O", "", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(0, result)
  end

  def test_84_round_8_X_blocked_at_edge_O_takes_random_open_position_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "O", "O", "X", "X", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    open_pos = [7, 8]
    result = open_pos.include? move
    assert_equal(true, result)
  end

  def test_85_round_8_X_blocked_at_edge_O_takes_random_open_position_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "O", "X", "", "X", "O"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    open_pos = [3, 6]
    result = open_pos.include? move
    assert_equal(true, result)
  end

  def test_86_round_8_X_blocked_at_corner_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "X", "O", "O", "O", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(1, result)
  end

  def test_87_round_8_X_blocked_at_corner_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "", "O", "X", "X", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(3, result)
  end

  def test_88_round_8_X_took_random_open_edge_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "X", "X", "O", "O", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(1, result)
  end

  def test_89_round_8_X_took_random_open_edge_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "O", "", "X", "X", "", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(3, result)
  end

  def test_90_round_8_X_took_random_non_opposite_corner_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "X", "X", "O", "X", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_91_round_8_X_took_random_non_opposite_corner_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "X", "X", "X", "O", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_92_round_8_X_blocked_at_corner_O_blocks_at_corner_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "O", "X", "X", "O", "X", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(1, result)
  end

  def test_93_round_8_X_blocked_at_corner_O_blocks_at_corner_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "X", "", "X", "", "O", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(3, result)
  end

  def test_94_round_8_X_blocked_at_edge_or_corner_O_wins_via_fork_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "X", "O", "", "O", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_95_round_8_X_blocked_at_edge_or_corner_O_wins_via_fork_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "X", "O", "X", "O", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(7, result)
  end

  def test_96_round_8_X_blocked_at_corner_O_blocks_at_edge_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "", "O", "X", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(3, result)
  end

  def test_97_round_8_X_blocked_at_corner_O_blocks_at_edge_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "", "O", "X", "X", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(3, result)
  end

  def test_98_round_9_X_ties_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "O", "O", "O", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(3, result)
  end

  def test_99_round_9_X_ties_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "O", "O", "X", "X", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_100_round_9_X_ties_v3
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "O", "O", "X", "X", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(7, result)
  end

  def test_101_round_9_X_ties_v4
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "X", "O", "O", "X", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_102_round_9_X_takes_last_open_position_no_win_or_block_v1
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "O", "O", "X", "", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_103_round_9_X_takes_last_open_position_no_win_or_block_v2
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "X", "X", "O", "O", "", "O", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_104_X_takes_win_over_block
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "O", "", "", "", "", "X", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(7, result)
  end

  def test_105_O_blocks_multiple_forks
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "X", "", "O", "O", "X", "X", "" ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    force_block = [0, 8]
    result = force_block.include? move
    assert_equal(true, result)
  end

  def test_106_O_blocks_multiple_forks
    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "X", "", "", "", "O"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    force_block = [2, 6]
    result = force_block.include? move
    assert_equal(true, result)
  end

  def test_107_round_1_X_takes_random_corner_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    corners = [0, 3, 12, 15]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_108_round_2_O_takes_random_corner_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    corners = [0, 3, 12, 15]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_109_X_takes_win_on_extended_board_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "", "X", "", "O", "", "", "O", "", "O", "", "X", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(2, result)
  end

  def test_110_O_takes_win_on_extended_board_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "X", "", "", "", "", "", "", "O", "", "X", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(6, result)
  end

  def test_111_X_blocks_win_on_extended_board_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "O", "X", "", "", "", "", "", "", "O", "", "X", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(6, result)
  end

  def test_112_O_blocks_win_on_extended_board_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "", "X", "", "O", "", "", "O", "", "", "", "X", "", "O", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(2, result)
  end

  def test_113_X_blocks_fork_on_extended_board_v1_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "O", "O", "", "O", "", "X", "", "", "", "X", "O", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(5, result)
  end

  def test_114_X_blocks_fork_on_extended_board_4x4_v2
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "X", "", "", "O", "O", "", "O", "", "", "X", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(5, result)
  end

  def test_115_O_blocks_fork_on_extended_board_4x4_v1
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "O", "", "X", "", "", "X", "", "X", "", "O", "", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(9, result)
  end

  def test_116_O_blocks_fork_on_extended_board_4x4_v2
    size = 4
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "X", "", "O", "", "X", "", "", "X", "", "X", "", "O", "", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(9, result)
  end

  def test_117_round_1_X_takes_center_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(12, result)
  end

  def test_118_round_2_O_takes_center_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(12, result)
  end

  def test_119_round_2_X_took_center_O_takes_a_random_corner_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["", "", "", "", "", "", "", "", "", "", "", "", "X", "", "", "", "", "", "", "", "", "", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.corners.include? move
    assert_equal(true, result)
  end

  def test_120_X_takes_win_on_extended_board_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "X", "X", "", "O", "", "", "", "O", "", "", "", "", "", "O", "", "", "O", "", "", "", "", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(1, result)
  end

  def test_121_O_takes_win_on_extended_board_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "", "X", "", "O", "", "", "", "", "", "", "", "", "", "O", "X", "", "X", "", "O", "", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(11, result)
  end

  def test_122_X_blocks_win_on_extended_board_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "", "", "X", "", "O", "", "", "", "", "", "", "", "", "", "O", "", "", "X", "", "O", "", "X", ""]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(11, result)
  end

  def test_123_O_blocks_win_on_extended_board_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "X", "X", "", "O", "", "", "", "O", "", "", "", "", "", "O", "", "", "O", "", "", "", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(1, result)
  end

  def test_124_X_blocks_fork_on_extended_board_5x5_v1
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "X", "", "X", "O", "O", "", "", "O", "", "", "X", "", "X", "O", "", "", "O", "O", "X", "O", "X", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(16, result)
  end

  def test_125_X_blocks_fork_on_extended_board_5x5_v2
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "O", "O", "", "X", "O", "", "O", "O", "", "X", "O", "X", "X", "X", "", "", "O", "O", "O", "X", "O", "X", "X", "X"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    blocks = [6, 16]
    result = blocks.include? move
    assert_equal(true, result)
  end

  def test_126_O_blocks_fork_on_extended_board_5x5_v1
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "X", "", "O", "X", "X", "O", "X", "O", "O", "O", "O", "X", "O", "X", "", "X", "", "X", "O", "O", "X", "X", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(18, result)
  end

  def test_127_O_blocks_fork_on_extended_board_5x5_v2
    size = 5
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "O", "X", "O", "X", "", "X", "", "X", "", "O", "O", "X", "O", "O", "X", "O", "", "", "X", "O", "O", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(8, result)
  end

  def test_128_round_1_X_takes_random_corner_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    move = p1.get_move(game.board.get_x, game.board.get_o, "X")
    corners = [0, 5, 30, 35]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_129_round_2_O_takes_random_corner_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    corners = [0, 5, 30, 35]
    result = corners.include? move
    assert_equal(true, result)
  end

  def test_130_X_takes_win_on_extended_board_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "X", "X", "", "X", "", "", "", "O", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "O", "O", "", "", "", "O", "", "", "", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(4, result)
  end

  def test_131_O_takes_win_on_extended_board_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "", "", "", "X", "", "O", "", "", "", "X", "O", "", "", "X", "", "", "", "X", "", "O", "", "", "X", "", "", "", "O", "", "X", "", "", "", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(14, result)
  end

  def test_132_X_blocks_win_on_extended_board_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "", "", "", "", "X", "", "O", "", "", "", "X", "", "", "", "", "", "", "", "X", "", "O", "", "", "X", "", "", "", "O", "", "", "", "", "", "X", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(14, result)
  end

  def test_133_O_blocks_win_on_extended_board_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "X", "X", "X", "", "X", "", "", "", "O", "", "", "", "", "", "", "", "X", "", "", "", "", "", "", "O", "O", "", "", "", "O", "", "", "", "", "", "O"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "O")
    assert_equal(4, result)
  end

end