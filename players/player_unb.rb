require_relative "../board/board.rb"
require_relative "../game/win.rb"  # for sandbox testing

# class for unbeatable computer player
class PlayerUnbeatable

  attr_reader :center, :corners, :opcor_1, :opcor_2
  attr_accessor :wins

  def initialize(size)
    @size = size
    @moves = [*0..(size * size) - 1]  # board positions
    @wins = []  # populated via get_move() with all winning positions
    @center = find_center(size)
    @corners = find_corners(size)
    @opcor_1 = @corners.values_at(0, 2)
    @opcor_2 = @corners.values_at(1, 3)
    @edges = find_edges(size)
  end

  def find_center(size)
    size % 2 == 1 ? center = (size * size - 1) / 2 : center = nil
  end

  def find_corners(size)
    cor_1 = size - size
    cor_2 = size - 1
    cor_3 = size * size - size
    cor_4 = size * size - 1
    corners = [cor_1, cor_2, cor_3, cor_4]
  end

  def find_edges(size)


  end

  def get_move(wins, x_pos, o_pos, mark)
    @wins = wins
    # Use current mark (X/O) to determine  current player, then call appropriate method to get position
    mark == "X" ? position = win_check(wins, x_pos, o_pos) : position = win_check(wins, o_pos, x_pos)
  end

  # Method to return position to win, call block_check() if no wins
  def win_check(wins, player, opponent)
    position = []  # placeholder for position that will give 3-in-a-row
    wins.each do |win|  # check each win pattern
      difference = win - player  # difference between current win array and player position array
      # if player 1 move from win, take position unless already opponent mark
      position.push(difference[0]) unless (opponent & difference).size == 1 if difference.size == 1
    end  # .sample in case of multiple wins, otherwise check for blocks
    position.size > 0 ? position.sample : block_check(wins, player, opponent)
  end

  # Method to return position to block, call poison_line() if no blocks
  def block_check(wins, player, opponent)
    position = []  # placeholder for position that will block the opponent
    wins.each do |win|  # check each win pattern
      difference = win - opponent  # difference between current win array and opponent position array
      # if opponent 1 move from win, block position unless already player mark
      position.push(difference[0]) unless (player & difference).size == 1 if difference.size == 1
    end  # .sample in case of multiple blocks, otherwise check for forks
    position.size > 0 ? position.sample : fork_check(wins, player, opponent)
  end

  # Method to create fork, force block if 2+ op forks, block fork if 1 op fork, or call get_cen()
  def fork_check(wins, player, opponent)
    block_fork = find_fork(wins, opponent, player)
    get_fork = find_fork(wins, player, opponent)
    if get_fork.size > 0  # if possible to create fork, do it
      move = get_fork.sample
    elsif block_fork.size > 1 && @size == 3  # if opponent can create multiple forks, force block
      move = get_adj(wins, player, opponent)
    elsif block_fork.size == 1 && @size == 3  # otherwise if opponent can create fork, block it
      move = block_fork[0]
    elsif @center != nil && [@center] & player + opponent == []
      move = get_cen(player, opponent)
    else 
      poison_line(wins, player, opponent)
    end
  end

  # Method to return the center position, or call get_op_cor()
  def get_cen(player, opponent)
    taken = player + opponent  # all occupied board positions
    if (taken & @center).size == 0  # if center is open
      position = 4  # then take it
    else
      get_op_cor(player, opponent)  # otherwise check for opposite corner
    end
  end

  # Method to return the corner opposite the opponent's corner or call get_avail_cor()
  def get_op_cor(player, opponent)
    p_corner = (player & @corners)  # determine the player's corners
    o_corner = (opponent & @corners)  # determine the opponent's corners
    if (@opcor_1 & p_corner).size == 0 && (@opcor_1 & o_corner).size == 1
      position = (@opcor_1 - o_corner)[0]  # opposite corner is in @opcor_1
    elsif (@opcor_2 & p_corner).size == 0 && (@opcor_2 & o_corner).size == 1
      position = (@opcor_2 - o_corner)[0]  # opposite corner is in @opcor_2
    else
      get_avail_cor(player, opponent)  # otherwise check for any open corner
    end
  end

  # Method to return random open corner or call get_avail_edg()
  def get_avail_cor(player, opponent)
    taken = player + opponent  # all occupied board positions
    avail_cor = @corners - (@corners & taken)  # determine which corners are taken
    if avail_cor.size > 0  # if there are any open corners
      position = avail_cor.sample  # take one of them
    else
      position = get_avail_edg(player, opponent)  # otherwise take an open edge
    end
  end

  # Method to return a random open edge
  def get_avail_edg(player, opponent)
    taken = player + opponent  # all occupied board positions
    avail_edg = @edges - (@edges & taken)  # determine which edges are taken
    position = avail_edg.sample  # take one of them
  end

  def poison_line(wins, player, opponent)
    target_lines = potential_wins(wins, player, opponent)
    open_positions = target_lines - player
    position = open_positions[0].sample
  end

  #--------------supporting methods for fork_check()---------------

  # Method to return array of positions that will result in a fork
  def find_fork(wins, forker, forkee)
    position_counts = count_positions(wins, forker, forkee)
    forking_moves = []
    position_counts.each do |position, count|
      forking_moves.push(position) if count > 1
    end
    forking_moves = (forking_moves - (forking_moves & forker))
    forking_moves.empty? ? [] : forking_moves
  end

  # Method to return hash of positions and counts to help identify forks
  def count_positions(wins, forker, forkee)
    potential_wins = get_potential_wins(wins, forker, forkee)
    position_counts = {}
    potential_wins.each do |potential_win|
      potential_win.each do |position|
        position_counts[position] = 0 if position_counts[position] == nil
        position_counts[position] += 1
      end
    end
    return position_counts
  end

  # Method to return array of potential wins for forking player
  def get_potential_wins(wins, forker, forkee)
    potential_wins = []
    wins.each do |win|
      potential_wins.push(win) if (forker & win).size > 0 && (forkee & win).size == 0
    end
    return potential_wins
  end

  # Method to return position to force opponent block without creating opponent fork
  def get_adj(wins, player, opponent)
    potential_wins = get_potential_wins(wins, player, opponent)  # get potential wins for player
    o_forks = find_fork(wins, opponent, player)  # get potential forks for opponent
    open_p = []  # array to collect all open positions that could create a player win
    potential_wins.each do |p_win|  # check each win for player and opponent positions
      open_p.push(p_win - player) if (p_win & player).size == 1 && (p_win & opponent).size == 0
    end
    if o_forks == @opcor_1 || o_forks == @opcor_2  # return position to force block without opponent fork
      move = (open_p.flatten - o_forks).sample
    elsif (open_p.flatten & o_forks).size > 0
      move = (open_p.flatten & o_forks).sample
    else
      move = open_p.flatten.sample
    end
  end

end

# Sandbox testing

mark = "X"
size = 3
board = Board.new(size)
win = Win.new(size)
unb = PlayerUnbeatable.new(size)
win.game_board = board.game_board  # populate Win board for calculating wins
win.populate_wins  # populate wins array in Win class
unb.wins = win.wins
board.game_board = ["X", "O", "", "", "", "", "", "", "", "", "", ""]

p unb.corners
p unb.opcor_1
p unb.opcor_2

# p win.wins
# p unb.wins

# p unb.check_center(win.wins, board.get_x, board.get_o)
# p unb.potential_wins(win.wins, board.get_x, board.get_o)
# p unb.get_move(win.wins, board.get_x, board.get_o, mark)
# @move = @player.get_move(@win.wins, @board.get_x, @board.get_o, @m_current)