require_relative "../board/board.rb"

# class for computer player that places mark on next open position
class PlayerSequential

  def initialize(size)
    @moves = [*0..(size*size)-1]  # board positions
  end

  # Method to return first open position
  def get_move(game_board)
    position = game_board.index("")  # get the index of the first open position
    move = @moves[position]  # get the corresponding location for the index
  end

end