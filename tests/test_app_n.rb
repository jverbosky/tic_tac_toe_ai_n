# be sure to use the unit test versions of attr_ in board.rb and game.rb
# - attr_accessor in /board/board.rb
# - attr_reader in /game/game.rb

require 'minitest/autorun'  # need for the Minitest::Test class
require 'rack/test'  # need for the Rack::Test::Methods mixin
require_relative '../app.rb'  # path to app file (one subdirectory higher than this file)

class TestApp < Minitest::Test  # TestApp subclass inherits from Minitest::Test class
  include Rack::Test::Methods  # Include the methods in the Rack::Test:Methods module (mixin)
  # Methods include: get, post, last_response, follow_redirect!

  def app
    TicTacToeAiNApp  # most examples use App.new - reason why we don't need .new here?     ?????
  end

  def test_get_entry_page
    get '/'  # verify a (get '/' do) route exists - doesn't need erb statement to pass
    assert(last_response.ok?)  # verify server response == 200 for (get '/') action - doesn't need erb statement to pass
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.body.include?('Please select the player types and board size:'))
    assert(last_response.body.include?('<form method="post" action="start_game">'))
    assert(last_response.body.include?('<select type="text" name="setup[p1_type]">'))
    assert(last_response.body.include?('<select type="text" name="setup[p2_type]">'))    
    assert(last_response.body.include?('<option value="Human">Human</option>'))
    assert(last_response.body.include?('<option value="Random">Random</option>'))
    assert(last_response.body.include?('<option value="Sequential">Sequential</option>'))
    assert(last_response.body.include?('<option value="Unbeatable">Unbeatable</option>'))
    assert(last_response.body.include?('<select type="text" name="setup[board_size]">'))
    assert(last_response.body.include?('<option value=3>3 x 3</option>'))
    assert(last_response.body.include?('<option value=4>4 x 4</option>'))
    assert(last_response.body.include?('<option value=5>5 x 5</option>'))
    assert(last_response.body.include?('<option value=6>6 x 6</option>'))
    assert(last_response.body.include?('<option value=7>7 x 7</option>'))
    assert(last_response.body.include?('<option value=8>8 x 8</option>'))
    assert(last_response.body.include?('<option value=9>9 x 9</option>'))
    assert(last_response.body.include?('<option value=10>10 x 10</option>'))
  end

  def test_play_human_round_1
    # use setup hash to instantiate objects and initialize variable sessions
    post '/start_game', setup: {"p1_type"=>"Human", "p2_type"=>"Unbeatable", "board_size"=>"3"}
    assert(last_response.ok?)
    # get '/play'
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 1'))
    assert(last_response.body.include?('It\'s Human X\'s move!'))
    assert(last_response.body.include?('Please select a location.'))
  end

  def test_play_computer_round_2  # play view displays every 2 rounds for AI players
    post '/start_game', setup: {"p1_type"=>"Random", "p2_type"=>"Unbeatable", "board_size"=>"3"}
    assert(last_response.ok?)
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 2'))
    assert(last_response.body.include?('Click anywhere on the board to continue.'))
  end

  def test_result_human_location_already_taken_3x3
    post '/start_game', setup: {"p1_type"=>"Human", "p2_type"=>"Unbeatable", "board_size"=>"3"}
    assert(last_response.ok?)
    get '/location_taken_test_3x3'  # route to seed game.round and board.game_board
    assert(last_response.ok?)
    post '/play', location: "0"
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 3'))
    assert(last_response.body.include?('That position isn\'t open. Try again Human X.'))
  end

  def test_result_human_location_already_taken_4x4
    post '/start_game', setup: {"p1_type"=>"Human", "p2_type"=>"Unbeatable", "board_size"=>"4"}
    assert(last_response.ok?)
    get '/location_taken_test_4x4'  # route to seed game.round and board.game_board
    assert(last_response.ok?)
    post '/play', location: "15"
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 3'))
    assert(last_response.body.include?('That position isn\'t open. Try again Human X.'))
  end

  def test_result_game_over_3x3
    post '/start_game', setup: {"p1_type"=>"Human", "p2_type"=>"Unbeatable", "board_size"=>"3"}
    assert(last_response.ok?)
    get '/game_over_test_3x3'  # route to seed game.round and board.game_board
    assert(last_response.ok?)
    post '/play', location: "2"
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 5'))
    assert(last_response.body.include?('Human X won the game!'))
    assert(last_response.body.include?('Press <b>Play</b> to start a new game.'))
  end

  def test_result_game_over_4x4
    post '/start_game', setup: {"p1_type"=>"Human", "p2_type"=>"Unbeatable", "board_size"=>"4"}
    assert(last_response.ok?)
    get '/game_over_test_4x4'  # route to seed game.round and board.game_board
    assert(last_response.ok?)
    post '/play', location: "1"
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 9'))
    assert(last_response.body.include?('Human X won the game!'))
    assert(last_response.body.include?('Press <b>Play</b> to start a new game.'))
  end

end