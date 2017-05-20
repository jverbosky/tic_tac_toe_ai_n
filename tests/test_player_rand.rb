# be sure to use the unit test versions of attr_ in board.rb and game.rb
# - attr_accessor in board.rb
# - attr_reader in game.rb
# - attr_reader in player_rand.rb

require "minitest/autorun"
require_relative "../players/player_rand.rb"
require_relative "../game/game.rb"

class TestPlayerRandom < Minitest::Test

  def test_1_verify_random_move
    size = 3
    game = Game.new(size)
    p1 = PlayerRandom.new(size)
    move = p1.get_move(game.board.game_board)
    result = p1.moves.include?(move)
    assert_equal(true, result)
  end

  def test_2_verify_random_takes_last_open_position_3x3
    size = 3
    game = Game.new(size)
    p1 = PlayerRandom.new(size)
    game.board.game_board = ["", "X", "O", "X", "O", "O", "O", "X", "X"]
    result = p1.get_move(game.board.game_board)
    assert_equal(0, result)
  end

  def test_3_verify_random_takes_last_open_position_4x4
    size = 4
    game = Game.new(size)
    p1 = PlayerRandom.new(size)
    game.board.game_board = ["X", "", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X"]
    result = p1.get_move(game.board.game_board)
    assert_equal(1, result)
  end

    def test_4_verify_random_takes_last_open_position_5x5
    size = 5
    game = Game.new(size)
    p1 = PlayerRandom.new(size)
    game.board.game_board = ["X", "O", "", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O"]
    result = p1.get_move(game.board.game_board)
    assert_equal(2, result)
  end

    def test_5_verify_random_takes_last_open_position_6x6
    size = 6
    game = Game.new(size)
    p1 = PlayerRandom.new(size)
    game.board.game_board = ["X", "O", "X", "", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X", "O", "X"]
    result = p1.get_move(game.board.game_board)
    assert_equal(3, result)
  end

end