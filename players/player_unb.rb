require_relative "../board/board.rb"
require_relative "../game/win.rb"  # for sandbox testing

# class for unbeatable computer player
class PlayerUnbeatable

  def initialize(size)
    @moves = [*0..(size*size)-1]  # board positions
    @wins = []  # populated via get_move() with all winning positions
  end

  def get_move(wins, x_pos, o_pos, mark)
    @wins = wins
    # Use current mark (X/O) to determine  current player, then call appropriate method to get position
    mark == "X" ? position = poison_line(wins, x_pos, o_pos) : position = poison_line(wins, o_pos, x_pos)
  end

  def poison_line(wins, player, opponent)
    target_lines = identify_lines(wins, player, opponent)
    position = target_lines.sample
  end

  def identify_lines(wins, player, opponent)
    

  end

end


# Sandbox testing

size = 3
board = Board.new(size)
board.game_board = ["X", "O", "", "", "", "", "", "", ""]
win = Win.new(size)
win.game_board = board.game_board  # populate Win board for calculating wins
win.populate_wins  # populate wins array in Win class
unb = PlayerUnbeatable.new(size)
mark = "X"

p unb.identify_lines(win.wins, board.get_x, board.get_o)


# p unb.get_move(win.wins, board.get_x, board.get_o, mark)


# @move = @player.get_move(@win.wins, @board.get_x, @board.get_o, @m_current)