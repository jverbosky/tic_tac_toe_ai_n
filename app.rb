####################################
############ Tic Tac Toe ###########
####################################

require 'sinatra'
require_relative './game/game.rb'

class TicTacToeAiNApp < Sinatra::Base

  enable :sessions  # allow variable value to persist through routes (don't use when need to update value)
  # enable :logging, :dump_errors, :raise_errors

  # reference for tracing variable value:
  # player_type = "Human"
  # puts "player_type: " + player_type.inspect

  # variables to hold player scores (global to persist through new game instances)
  $x_score = 0  # global for X score to persist through multiple games
  $o_score = 0  # global for O score to persist through multiple games

  # # route to trace variables through route iterations
  # before do
  #   log = File.new("sinatra.log", "a")
  #   STDOUT.reopen(log)
  #   STDERR.reopen(log)
  # end

  # route to prompt player for game board size
  get '/' do
    session[:intro] = [["", "", ""], ["", "", ""], ["", "", ""]]  # board for intro screens
    erb :setup, layout: :min_js_layout, locals: {rows: session[:intro]}
  end

  # route to handle game setup and start the game
  post '/start_game' do
    setup_hash = params[:setup]
    size = setup_hash["board_size"].to_i  # extract size & player types from hash
    player_type = setup_hash.select { |key, value| key != "board_size" }
    session[:game] = Game.new(size)  # create a new game instance
    session[:game].select_players(player_type)  # initialize player objects based on player_type hash
    session[:p1_type] = session[:game].p1_type  # assign p1_type session to @p1_type in game.rb
    session[:p2_type] = session[:game].p2_type  # assign p1_type session to @p2_type in game.rb
    round = session[:game].round  # collect current round for messaging
    rows = session[:game].output_board  # grab the current board to display via layout.erb
    session[:game].set_players  # update player info
    session[:messaging] = session[:game].messaging  # access messaging instance via game instance
    mark = session[:game].m_current  # collect current mark for messaging
    feedback = session[:messaging].human_messaging(round, mark)  # update intro human player messaging
    next_player = session[:game].pt_next
    erb :play, locals: {rows: rows, round: round, feedback: feedback, next_player: next_player}
  end

  # route to allow input of human player move
  # get '/play_human' do
    # round = session[:game].round  # collect current round for messaging
    # rows = session[:game].output_board  # grab the current board to display via layout.erb
    # session[:game].set_players  # update player info
    # mark = session[:game].m_current  # collect current mark for messaging
    # feedback = session[:messaging].human_messaging(round, mark)  # update intro human player messaging
    # erb :play_human, locals: {rows: rows, round: round, feedback: feedback}
  # end

  # route to display game board, round and human player move details
  post '/play_human' do
    move = params[:location]  # collect the specified move from play_human form
    session[:game].make_move(move)  # evaluate move for route selection
    feedback = session[:messaging].feedback  # collect the resulting move messaging
    session[:game].set_players  # update player info
    mark = session[:game].m_current  # collect current mark for messaging
    round = session[:game].round  # collect current round for messaging
    rows = session[:game].output_board  # grab the current board to display via layout.erb
    next_player = session[:game].pt_next
    if session[:game].game_over?  # if game is over
      winner = session[:game].end_game  # evaluate endgame items and collect winner for endgame messaging
      endgame_result = session[:messaging].display_results(session[:p1_type], session[:p2_type], winner)
      round -= 1  # roll back round count to reflect winning round
      erb :game_over, layout: :min_js_layout, locals: {rows: rows, round: round, result: endgame_result}  # display final results
    elsif feedback =~ /^That/  # if feedback ~ taken position, reprompt via play_human
      erb :play, locals: {rows: rows, round: round, feedback: feedback}
    else  # otherwise display move results
      feedback = session[:messaging].human_messaging(round, mark)  # update human player messaging
      erb :play, locals: {rows: rows, round: round, feedback: feedback, next_player: next_player}
    end
  end

  # route for front-end testing to verify feedback if taken position is selected
  get '/location_taken_test' do
    session[:game].round = 3  # use for front-end testing
    session[:game].board.game_board = ["X", "", "", "", "O", "", "", "", ""]
  end

  # route for front-end testing to use game_over views in /play_ai and /result_human
  get '/game_over_test' do
    session[:game].round = 5  # use for front-end testing
    session[:game].board.game_board = ["X", "X", "", "", "O", "", "O", "", ""]
  end

end