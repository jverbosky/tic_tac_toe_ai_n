# be sure to use the unit test versions of attr_ in board.rb and game.rb
# - attr_accessor in board.rb
# - attr_reader in game.rb

require "minitest/autorun"
require_relative "../players/player_seq.rb"
require_relative "../game/game.rb"

class TestPlayerSequential < Minitest::Test

  def test_1_verify_0_board_empty_3x3
    size = 3
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_2_verify_0_board_empty_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_3_verify_0_board_empty_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_4_verify_0_board_empty_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_5_verify_0_board_not_empty_3x3
    size = 3
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["", "", "", "X", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_6_verify_0_board_not_empty_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["", "", "", "", "", "", "", "", "X", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_7_verify_0_board_not_empty_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["", "", "", "", "", "", "", "", "", "", "", "", "X", "", "", "", "", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_8_verify_0_board_not_empty_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["", "", "", "", "", "", "", "", "", "X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_9_verify_4_3x3
    size = 3
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["X", "O", "O", "X", "", "", "", "X", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(4, result)
  end

  def test_10_verify_4_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["O", "X", "O", "X", "", "", "X", "", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(4, result)
  end

    def test_11_verify_4_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["O", "O", "X", "X", "", "", "", "", "", "", "X", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(4, result)
  end

    def test_12_verify_4_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerSequential.new(size)
    game.board.game_board = ["X", "O", "X", "O", "", "", "", "", "X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    result = p1.get_move(game.board.game_board)
    assert_equal(4, result)
  end

end