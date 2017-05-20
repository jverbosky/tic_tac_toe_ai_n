# class for unbeatable computer player on NxN board
class PlayerUnbeatable

  # attr_reader :center, :corners, :opcor_1, :opcor_2, :edges  # use for unit testing

  def initialize(size, wins)
    @size = size
    @moves = [*0..(size * size) - 1]  # board positions
    @wins = wins  # populated via get_move() with all winning positions
    @center = find_center(size)  # "absolute" center position
    @corners = find_corners(size)  # corner positions
    @opcor_1 = @corners.values_at(0, 3)  # opposite corners (set 1)
    @opcor_2 = @corners.values_at(1, 2)  # opposite corners (set 2)
    @edges = find_edges(size)  # edge positions
  end

  # Method to populate @center during initialization
  def find_center(size)
    # assign center to "absolute" center or nil if none
    size % 2 == 1 ? center = (size * size - 1) / 2 : center = nil
  end

  # Method to populate @corners during initialization
  def find_corners(size)
    cor_1 = 0  # size - size
    cor_2 = size - 1
    cor_3 = size * size - size
    cor_4 = size * size - 1
    corners = [cor_1, cor_2, cor_3, cor_4]
  end

  # Method to populate @edges during initialization
  def find_edges(size)
    t_edges = @wins.values_at(0)[0] - @corners
    b_edges = @wins.values_at(size - 1)[0] - @corners
    l_edges = @wins.values_at(size)[0] - @corners
    r_edges = @wins.values_at(size * 2 - 1)[0] - @corners
    edges = t_edges + b_edges + l_edges + r_edges
  end

  # Method to drive other move selection methods
  def get_move(x_pos, o_pos, mark)
    # Use current mark (X/O) to determine  current player, then call appropriate method to get position
    mark == "X" ? position = win_check(x_pos, o_pos) : position = win_check(o_pos, x_pos)
  end

  # Method to return position to win, call block_check() if no wins
  def win_check(player, opponent)
    position = []  # placeholder for position that will give 3-in-a-row
    @wins.each do |win|  # check each win pattern
      difference = win - player  # difference between current win array and player position array
      # if player 1 move from win, take position unless already opponent mark
      position.push(difference[0]) unless (opponent & difference).size == 1 if difference.size == 1
    end  # .sample in case of multiple wins, otherwise check for blocks
    position.size > 0 ? position.sample : block_check(player, opponent)
  end

  # Method to return position to block, call poison_line() if no blocks
  def block_check(player, opponent)
    position = []  # placeholder for position that will block the opponent
    @wins.each do |win|  # check each win pattern
      difference = win - opponent  # difference between current win array and opponent position array
      # if opponent 1 move from win, block position unless already player mark
      position.push(difference[0]) unless (player & difference).size == 1 if difference.size == 1
    end  # .sample in case of multiple blocks, otherwise check for forks
    position.size > 0 ? position.sample : fork_check(player, opponent)
  end

  # Method to create fork, force block if 2+ op forks, block fork if 1 op fork, or call get_cen()
  def fork_check(player, opponent)
    block_fork = find_fork(opponent, player)  # forks for opponent
    get_fork = find_fork(player, opponent)  # forks for player
    if block_fork.size > 0 && @size > 3  # prioritize fork blocking for boards 4x4 and up, if possible
      move = block_fork.sample
    elsif get_fork.size > 0  # prioritize fork creation for 3x3 boards, if possible
      move = get_fork.sample
    elsif block_fork.size > 1 && @size == 3  # 3x3 boards: if opponent can create multiple forks, force block
      move = get_adj(player, opponent)
    elsif block_fork.size == 1 && @size == 3  # 3x3 boards: otherwise if opponent can create fork, block it
      move = block_fork[0]
    else @center != nil && [@center] & player + opponent == []  # otherwise take (true) center
      move = get_cen(player, opponent)
    end
  end

  # Method to return the center position, or call get_op_cor()
  def get_cen(player, opponent)
    taken = player + opponent  # all occupied board positions
    # if center is open & board has a true center (3x3, 5x5, etc.)
    if (taken & [@center]).size == 0 && @size % 2 == 1
      position = @center  # then take it
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
    elsif @size == 3
      position = get_avail_edg(player, opponent)  # otherwise take an open edge (3x3 only)
    else 
      poison_line(player, opponent)  # otherwise check for poison positions (4x4 and up)
    end
  end

  # Method to return a random open edge
  def get_avail_edg(player, opponent)
    taken = player + opponent  # all occupied board positions
    avail_edg = @edges - (@edges & taken)  # determine which edges are taken
    position = avail_edg.sample  # take one of them
  end

  # Method to "poison" winning lines on boards larger than 3x3
  def poison_line(player, opponent)
    open_positions = @moves - (player + opponent)
    target_lines = get_potential_wins(player, opponent).flatten
    if target_lines != []  # target winning lines that are not empty
      # positions for target lines that contain opponent marks
      poison_positions = open_positions & (target_lines - player)
      position = poison_positions.sample  # take a random position to poison line
    else
      position = open_positions.sample  # otherwise take a random position (catchall)
    end
  end

  #--------------supporting methods for fork_check()---------------

  # Method to return array of positions that will result in a fork
  def find_fork(forker, forkee)
    position_counts = count_positions(forker, forkee)
    forking_moves = []
    position_counts.each do |position, count|
      forking_moves.push(position) if count > 1
    end
    forking_moves = (forking_moves - (forking_moves & forker))
    forking_moves.empty? ? [] : forking_moves
  end

  # Method to return hash of positions and counts to help identify forks
  def count_positions(forker, forkee)
    potential_wins = get_potential_wins(forker, forkee)
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
  def get_potential_wins(forker, forkee)
    potential_wins = []
    @wins.each do |win|
      if @size == 3
        potential_wins.push(win) if (forker & win).size > 0 && (forkee & win).size == 0
      else
        potential_wins.push(win) if (forker & win).size > 1 && (forkee & win).size == 0
      end
    end
    return potential_wins
  end

  # Method to return position to force opponent block without creating opponent fork
  def get_adj(player, opponent)
    potential_wins = get_potential_wins(player, opponent)  # get potential wins for player
    o_forks = find_fork(opponent, player)  # get potential forks for opponent
    open_p = []  # array to collect all open positions that could create a player win
    potential_wins.each do |p_win|  # check each win for player and opponent positions
      open_p.push(p_win - player) if (p_win & player).size == 1 && (p_win & opponent).size == 0
    end
    if o_forks == @opcor_1 || o_forks == @opcor_2  # if opponent has opposite corners, can result in fork
      move = (open_p.flatten - o_forks).sample  # so return position to force block without opponent fork
    elsif (open_p.flatten & o_forks).size > 0  # else if no risk of creating opponent fork
      move = (open_p.flatten & o_forks).sample  # return any forking position
    else
      move = open_p.flatten.sample  # otherwise take a random open position
    end
  end

end