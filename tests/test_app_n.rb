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
    TicTacToeNApp  # most examples use App.new - reason why we don't need .new here?     ?????
  end

  def test_get_entry_page
    get '/'  # verify a (get '/' do) route exists - doesn't need erb statement to pass
    assert(last_response.ok?)  # verify server response == 200 for (get '/') action - doesn't need erb statement to pass
    assert(last_response.body.include?('Please select the board size:'))
    assert(last_response.body.include?('<form method="post" action="start_game">'))
    assert(last_response.body.include?('<select type="text" name="size">'))
    assert(last_response.body.include?('<option value=3>3 x 3</option>'))
    assert(last_response.body.include?('<option value=4>4 x 4</option>'))
    assert(last_response.body.include?('<option value=5>5 x 5</option>'))
    assert(last_response.body.include?('<option value=6>6 x 6</option>'))
    assert(last_response.body.include?('<option value=7>7 x 7</option>'))
    assert(last_response.body.include?('<option value=8>8 x 8</option>'))
    assert(last_response.body.include?('<option value=9>9 x 9</option>'))
    assert(last_response.body.include?('<option value=10>10 x 10</option>'))
    assert(last_response.body.include?('<option value=11>11 x 11</option>'))
    assert(last_response.body.include?('<option value=12>12 x 12</option>'))
  end

  def test_play_human_round_1
    post '/start_game', size: "3"  # use to instantiate objects and initialize variable sessions
    assert(last_response.ok?)
    get '/play_human'
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 1'))
    assert(last_response.body.include?('It\'s Human X\'s move!'))
    assert(last_response.body.include?('Please select a location.'))
  end

  def test_result_human_location_already_taken
    post '/start_game', size: "3"  # use to instantiate objects and initialize variable sessions
    assert(last_response.ok?)
    get '/location_taken_test'  # route to seed game.round and board.game_board
    assert(last_response.ok?)
    post '/play_human', location: "0"
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 3'))
    assert(last_response.body.include?('That position isn\'t open. Try again Human X.'))
  end

  def test_result_human_game_over
    post '/start_game', size: "3"  # use to instantiate objects and initialize variable sessions
    assert(last_response.ok?)
    get '/game_over_test'  # route to seed game.round and board.game_board
    assert(last_response.ok?)
    post '/play_human', location: "2"
    # output = last_response.to_a  # use to put last_response object data in an array
    # puts "last response: #{output}"  # use to make last_response data visible for seeing errors
    assert(last_response.ok?)
    assert(last_response.body.include?('Round 5'))
    assert(last_response.body.include?('Human X won the game!'))
    assert(last_response.body.include?('Press <b>Play</b> to start a new game.'))
  end

end