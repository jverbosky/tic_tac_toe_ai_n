require_relative "messaging.rb"  # class to handle messaging
require_relative "win.rb"  # class to handle endgame evaluation
require_relative "../board/board.rb"  # class to handle board updates and queries
require_relative "../players/player_rand.rb"  # class for random AI player
require_relative "../players/player_seq.rb"  # class for sequential AI player
require_relative "../players/player_unb.rb"  # class for unbeatable AI player

# class to handle game logic
class Game

  attr_accessor :move, :round
  attr_reader :p1_type, :p2_type, :m_current, :m_next, :pt_next, :pt_current, :messaging
  # attr_accessor :move, :round, :board, :p1_type, :p2_type, :player, :pt_current, :m_current, :pt_next, :m_next, :board_index  # use for unit testing
  # attr_reader :pt_next, :messaging, :win  # use for unit testing

  def initialize(size)  # size = board size (ex: 3 -> 3x3 board, 4 -> 4x4 board)
    @size = size  # board size (size x size)
    @board = Board.new(size)  # Board class instance
    @messaging = Messaging.new  # Messaging class instance, accessible to app.rb
    @win = Win.new(size)  # Win class instance
    @win.game_board = @board.game_board  # populate Win board for calculating wins
    @win.populate_wins  # populate wins array in Win class
    @round = 1  # current game round
    @p1 = ""  # Player object instance for X
    @p1_type = ""  # X player type ("Human", "Unbeatable", "Random", "Sequential")
    @p2 = ""  # Player object instance for O
    @p2_type = ""  # O player type ("Human", "Unbeatable", "Random", "Sequential")
    @player = ""  # used to generically collect AI player move
    @pt_current = ""  # view messaging - current player type
    @pt_next = ""  # view messaging - next player type
    @m_current = ""  # view messaging - current player character (X/O)
    @m_next = ""  # view messaging - next player character (O/X)
    @move = ""  # view messaging - current player's move
  end

  # Method to output the game board based on user-specified size
  def output_board
    rows = @board.game_board.each_slice(@size).to_a
  end

  # Method to handle player type selection
  def select_players(player_type)
    @p1_type = player_type["p1_type"]
    case @p1_type
      when "Random" then @p1 = PlayerRandom.new(@size)
      when "Sequential" then @p1 = PlayerSequential.new(@size)
      when "Unbeatable" then @p1 = PlayerUnbeatable.new(@size, @win.wins)
    end
    @p2_type = player_type["p2_type"]
    case @p2_type
      when "Random" then @p2 = PlayerRandom.new(@size)
      when "Sequential" then @p2 = PlayerSequential.new(@size)
      when "Unbeatable" then @p2 = PlayerUnbeatable.new(@size, @win.wins)
    end
  end

  # Method to update instance variables for AI move collection and view messaging
  def set_players
    if @round % 2 == 1  # X is current if odd-numbered round
      @player = @p1
      @pt_current = @p1_type
      @pt_next = @p2_type
      @m_current = "X"
      @m_next = "O"
    else  # otherwise O is current
      @player = @p2
      @pt_current = @p2_type
      @pt_next = @p1_type
      @m_current = "O"
      @m_next = "X"
    end
  end

  # Method to call human_move() or ai_move methods depending on player type
  def make_move(move)
    set_players  # update @player_, @player_type_ and @mark_ variables for current round
    @pt_current == "Human" ? human_move(move) : ai_move  # move() call based on player type
    @round += 1 if valid_move?  # if the move is valid, increment the @round counter
  end

  # Method to assign move to @move instance variable for ease-of-access
  def human_move(move)
    @move = move.to_i  # POST value is a string, so convert to integer
  end

  # Method to collect move from AI player instance
  def ai_move
    if @pt_current == "Unbeatable"  # if AI player is unbeatable, no need to pass round
      @move = @player.get_move(@board.get_x, @board.get_o, @m_current)
    else  # otherwise just pass the current board to the random or sequential AI player
     @move = @player.get_move(@board.game_board)
    end
  end

  # Method that updates the board and messaging accordingly, called by make_move
  def valid_move?
    if @board.position_open?(@move) # determine if position open
      @board.set_position(@move, @m_current)  # if so, update the board and messaging
      @messaging.valid_move(@round, @move, @pt_current, @m_current, @pt_next, @m_next)
      return true  # drives round increment in make_move
    else  # if position is already taken
      @messaging.invalid_move(@m_current)  # reprompt for a new move
      return false  # drives round increment in make_move
    end
  end

  # Method to determine if game is over based on conditions (x won, o won, board full)
  def game_over?
    @win.update_board(@board.game_board)  # update the @win object's board for evaluation
    @win.x_won? || @win.o_won? || @win.board_full?  # determine if the game is over
  end

  # Method to handle endgame items (winning positions, scoring, winner)
  def end_game
    if @win.x_won?  # if X won
      $x_score += 1  # increment global $x_score
      return "X"  # return "X" for messaging evaluation
    elsif @win.o_won?  # if O won
      $o_score += 1  # increment global $o_score
      return "O"  # return "O" for messaging evaluation
    else  # otherwise if neither player won
      return "tie"  # return "tie" for messaging evaluation
    end
  end

end