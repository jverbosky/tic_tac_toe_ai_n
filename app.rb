####################################
############ Tic Tac Toe ###########
####################################

require 'sinatra'
require_relative './game/game.rb'

class TicTacToeAiNApp < Sinatra::Base

  enable :sessions  # allow variable value to persist through routes (don't use when need to update value)
  # enable :logging, :dump_errors, :raise_errors  # enable logging for tracing values

  # Reference for tracing variable value in sinatra.log file when logging is enable:
  # player_type = "Human"
  # puts "player_type: " + player_type.inspect

  # Variables to hold player scores (global to persist through new game instances)
  $x_score = 0  # global for X score to persist through multiple games
  $o_score = 0  # global for O score to persist through multiple games

  # Route to trace variables through route iterations
  # before do
  #   log = File.new("sinatra.log", "a")
  #   STDOUT.reopen(log)
  #   STDERR.reopen(log)
  # end

  # Route to prompt player for game board size
  get '/' do
    intro = [["", "", ""], ["", "", ""], ["", "", ""]]  # board for setup view
    erb :setup, layout: :min_js_layout, locals: {rows: intro}
  end

  # Route to handle game setup and start the game
  post '/start_game' do
    setup_hash = params[:setup]  # ex: {"p1_type"=>"Human", "p2_type"=>"Unbeatable", "board_size"=>"3"}
    size = setup_hash["board_size"].to_i  # extract size & player types from hash
    player_type = setup_hash.select { |key, value| key != "board_size" }
    session[:game] = Game.new(size)  # create a new game instance
    session[:game].select_players(player_type)  # initialize player objects based on player_type hash
    session[:p1_type] = session[:game].p1_type  # assign p1_type session to @p1_type in game.rb
    session[:p2_type] = session[:game].p2_type  # assign p1_type session to @p2_type in game.rb
    session[:game].set_players  # update player info
    session[:messaging] = session[:game].messaging  # access messaging instance via game instance
    current_player = session[:game].pt_current  # collect the current player for view messaging
    next_player = session[:game].pt_next  # collect the next player for view messaging
    if current_player != "Human"  # if the current player is a computer player
      move = session[:game].make_move("")  # call make_move() to get the move
      round = session[:game].round  # collect current round for messaging (incremented due to AI move)
      rows = session[:game].output_board  # grab the updated board to display via layout.erb
      if next_player == "Human"  # if the next player is human
        mark = session[:game].m_next  # collect next mark for view messaging
        feedback = session[:messaging].human_messaging(round, mark)  # update human player messaging
      end
      erb :play, locals: {rows: rows, round: round, feedback: feedback, current_player: current_player, next_player: next_player}
    else  # otherwise if the current player is human
      round = session[:game].round  # collect current round for messaging
      rows = session[:game].output_board  # grab the current board to display via layout.erb
      mark = session[:game].m_current  # collect current mark for messaging
      feedback = session[:messaging].human_messaging(round, mark)  # update human player messaging
      erb :play, locals: {rows: rows, round: round, feedback: feedback, current_player: current_player, next_player: next_player}
    end
  end

  # Route to display game board, round and human player move details
  post '/play' do
    move = params[:location]  # collect the specified move from play form
    session[:game].make_move(move)  # evaluate move for route selection
    feedback = session[:messaging].feedback  # collect the resulting move messaging
    session[:game].set_players  # update player info
    mark = session[:game].m_current  # collect current mark for messaging
    round = session[:game].round  # collect current round for messaging
    rows = session[:game].output_board  # grab the current board to display via layout.erb
    current_player = session[:game].pt_current  # collect the current player for view messaging
    next_player = session[:game].pt_next  # collect the next player for view messaging
    if session[:game].game_over?  # if game is over
      winner = session[:game].end_game  # evaluate endgame items and collect winner for endgame messaging
      endgame_result = session[:messaging].display_results(session[:p1_type], session[:p2_type], winner)
      round -= 1  # roll back round count to reflect winning round
      erb :game_over, layout: :min_js_layout, locals: {rows: rows, round: round, result: endgame_result}  # display final results
    elsif feedback =~ /^That/  # if feedback ~ taken position, reprompt via play_human
      erb :play, locals: {rows: rows, round: round, feedback: feedback, current_player: current_player, next_player: next_player}
    elsif current_player != "Human"  # if the current player is a computer player
      move = session[:game].make_move("")  # call make_move() to get the move
      if session[:game].game_over?  # if game is over
        rows = session[:game].output_board  # grab the current board to display via layout.erb
        winner = session[:game].end_game  # evaluate endgame items and collect winner for endgame messaging
        endgame_result = session[:messaging].display_results(session[:p1_type], session[:p2_type], winner)
        erb :game_over, layout: :min_js_layout, locals: {rows: rows, round: round, result: endgame_result}  # display final results
      else  # otherwise if the game is not over
        round = session[:game].round  # collect current round for messaging
        rows = session[:game].output_board  # grab the current board to display via layout.erb
        if next_player == "Human"  # if the next player is human
          mark = session[:game].m_next  # collect next mark for messaging
          feedback = session[:messaging].human_messaging(round, mark)  # update human player messaging
        end
        erb :play, locals: {rows: rows, round: round, feedback: feedback, current_player: current_player, next_player: next_player}
      end
    else  # otherwise display move results
      feedback = session[:messaging].human_messaging(round, mark)  # update human player messaging
      erb :play, locals: {rows: rows, round: round, feedback: feedback, current_player: current_player, next_player: next_player}
    end
  end

# ---------------- Routes for front-end testing ----------------

  # Route for front-end testing to verify feedback if taken position is selected
  get '/location_taken_test_3x3' do
    session[:game].round = 3
    session[:game].board.game_board = ["X", "", "", "", "O", "", "", "", ""]
  end

  # Route for front-end testing to verify feedback if taken position is selected
  get '/location_taken_test_4x4' do
    session[:game].round = 3
    session[:game].board.game_board = ["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "O"]
  end

  # Route for front-end testing to use game_over views in /play
  get '/game_over_test_3x3' do
    session[:game].round = 5
    session[:game].board.game_board = ["X", "X", "", "", "O", "", "O", "", ""]
  end

  # Route for front-end testing to use game_over views in /play
  get '/game_over_test_4x4' do
    session[:game].round = 9
    session[:game].board.game_board = ["X", "", "X", "X", "", "O", "O", "", "X", "O", "", "", "", "", "", "O"]
  end

end