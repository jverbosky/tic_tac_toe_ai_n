# class to handle web app messaging
class Messaging

  attr_reader :feedback  # @feedback needs to be available to app.rb routes

  def initialize
    @feedback = ""  # view messaging - move status or reprompt
  end

  # Method to update @feedback if move is valid
  def valid_move(round, move, pt_current, m_current, pt_next, m_next)
    @feedback = ""  # reset feedback to empty string in case invalid_move() called
  end

  # Method to update @feedback with reprompt text if move is invalid
  def invalid_move(m_current)
    @feedback = "That position isn't open. Try again Human #{m_current}."
  end

  # Method to handle /play_human view messaging for human players
  def human_messaging(round, mark)
    if round <= 2  # if it's round 1 or 2, use messaging for X/O's first move
      return "It's Human #{mark}'s move!"
    else  # otherwise use messaging for subsequent moves
      return "It's Human #{mark}'s move again!"
    end
  end

  # Method to display endgame messaging
  def display_results(p1_type, p2_type, winner)
    if winner == "X"
      return "#{p1_type} X won the game!"  # advise on win
    elsif winner == "O"
      return "#{p2_type} O won the game!"  # advise on win
    elsif winner == "tie"  # if no one won
      return "It was a tie!"  # advise on tie
    end
  end

end