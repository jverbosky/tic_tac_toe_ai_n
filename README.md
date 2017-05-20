## Tic Tac Toe ##

A web app developed using Ruby, Sinatra, HTML, CSS and JavaScript.

Highlights include:

1. A mobile device friendly UI with a responsive game board.
2. Game board sizes ranging from 3 x 3 up to 10 x 10.
3. Support for human and three different types of computer opponents (sequential, random, unbeatable).
4. Player move validation.
5. Cumulative scoring for multiple games.

----------

## Gameplay ##

Please refer to the following sections for details on how to run and play the game:

- Running the Game
- Player and Board Size Selection
- Move Selection
- Cumulative Scoring

----------

**Running the Game**

----------

To open the game from any Internet-connected device, use the following URL:

[https://tic-tac-toe-n-ai-jv.herokuapp.com/](https://tic-tac-toe-n-ai-jv.herokuapp.com/)

----------

To run the game locally:

1. Make sure that [Ruby](https://www.ruby-lang.org/en/documentation/installation/) is installed.
2. Make sure that the [Sinatra](https://github.com/sinatra/sinatra) gem is installed.  *Note that installing the Sinatra gem will install other gems necessary to run the game locally, such as rack.*
3. Navigate to the directory which contains **app.rb** in a terminal (command prompt) session.
4. Run the following command to launch the Sinatra web server:

	`rackup`

To open the game locally once it is running via *rackup*, use the following URL:

[http://localhost:9292](http://localhost:9292/)

----------

**Player and Board Size Selection**

----------

1. On the initial screen, use the **Player 1 (X)** and **Player 2 (O)** drop-downs to specify the desired player type:

	- **Human** - a human player where moves can be specified by the player
	- **Random** - a computer player that randomly selects an open position
	- **Sequential** - a computer player that selects the next open position
	- **Unbeatable** - an unbeatable computer player based primarily on Newell and Simon's tic-tac-toe program [rules](https://en.wikipedia.org/wiki/Tic-tac-toe#Strategy), with slight adjustments for boards larger than 3 x 3.  

2. Use the **Board Size** drop-down to to specify the desired board size.  Sizes range from 3 x 3 up to 10 x 10. 

3. Click the **Submit** button to begin the game.

----------

**Playing the Game**

----------

**Human versus Human**

1. Player X selects a desired board position by clicking (or tapping) on it.
2. Player O selects a desired board position by clicking (or tapping) on it.
3. Continue taking turns until a player wins or the game ends in a tie.

**Human versus Computer**

1. The human player selects a desired board position by clicking or tapping on it.
2. The computer player will automatically select a board position.
3. Continue selecting board positions until a player wins or the game ends in a tie.

**Computer versus Computer**

1. Player X will automatically select a board position in round 1. 
2. For round 2, click (or tap) anywhere on the game board to prompt the computer players to select board positions.
3. Continue clicking (or tapping) on the game board to prompt the computer players to move, until a player wins or the game ends in a tie.

----------

**Endgame Results**

----------

Once the game is over, the winner will be announced.  To start a new game, click (or tap) the **Play** button.

----------

**Cumulative Scoring**

----------

- If player X or O wins a game, the corresponding **X Score** or **O Score** at the top of the screen will be incremented by 1 accordingly.
- If the game ends in a tie, neither score will be incremented.

----------

## Tests ##

Please refer to the following sections for details on how to run the unit and front-end tests for the web app.

----------

**Unit and Front-End Tests Overview**

----------

Tests have been developed to verify that the methods in each class file and routes/views in the web app are working as intended.  All tests are located in the **/tests** directory.

Unit Tests:

- **test\_board\_n.rb** > **/board/board.rb** (17 tests)
- **test\_game\_n.rb** > **/game/game.rb** (33 tests)
- **test\_messaging\_n.rb** > **/game/messaging.rb** (11 tests)
- **test\_player\_rand\_n.rb** > **/players/player\_rand.rb** (8 tests)
- **test\_player\_seq\_n.rb** > **/players/player\_seq.rb** (12 tests)
- **test\_player\_unb\_n.rb** > **/players/player\_unb.rb** (133 tests)
- **test\_win\_n.rb** > **/game/win.rb** (68 tests)

Front-End Tests:

- **test\_app\_n.rb** > **/app.rb** (7 tests, 49 assertions)

----------

**Preparing to Run Tests**

----------
In order to seed values and leverage helper methods, some tests require greater access to instance variables within a class than is required to simply run the web app.

As a result, some classes have additional "unit test" versions of *attr\_accessor* and *attr\_reader* statements.  These  are identified by a **# user for unit testing** comment, and need to be used instead of  the default *attr\_accessor* and *attr\_reader* statements prior to running any associated unit tests.

For example, the non-testing *attr\_accessor* and *attr\_reader* statements in **/board/board.rb** are:

	attr_reader :game_board
	# attr_accessor :game_board  # use for unit testing

However, prior to running **/tests/test\_board_n.rb** against **/board/board.rb**, these statements must be changed as follows:

	# attr_reader :game_board
	attr_accessor :game_board  # use for unit testing

Note that the required statements are specified in the comments at the top of each unit test file.  For example, the following comments are at the top of **/tests/test\_board_n.rb**:

    # be sure to use the unit test version of attr_ in /board/board.rb
    # - attr_accessor in /board/board.rb

----------

**Running Unit Tests**

----------

Once the required "unit test" versions of *attr\_accessor* and *attr\_reader* statements are available, unit tests can be run by doing the following:

1. Navigate to the **/tests** directory in a terminal (command prompt) session
2. Run the following command for the desired unit test:<br>

    ruby *test\_file\_name.rb*

For example, to run the unit tests for **board.rb** (the Board class), run the following command from the **/tests** directory:

	ruby test_board_n.rb

The resulting output will indicate the success of the unit tests:

	Run options: --seed 44335

	# Running:

	.................

	Finished in 0.003500s, 4857.5148 runs/s, 4857.5148 assertions/s.

	17 runs, 17 assertions, 0 failures, 0 errors, 0 skips

----------

**Running Front-End Tests**

----------

The **/tests/test\_app\_n.rb** file contains front-end tests for the web app routes (**app.rb**) and associated views (for example, **/views/get_size.erb**).

As with the unit tests, the required "unit test" versions of *attr\_accessor* and *attr\_reader* statements must be used (this time in **/board/board.rb** and **/game/game.rb**).  Once the required "unit test" versions of *attr\_accessor* and *attr\_reader* statements are available, front-end tests can be run by doing the following:

1. Navigate to the **/tests** directory in a terminal (command prompt) session.
2. Run the following command for the front-end test:

	ruby test_app_n.rb

The resulting output will indicate the success of the front-end tests and assertions:

	Run options: --seed 3611

	# Running:

	.......

	Finished in 0.198960s, 35.1830 runs/s, 246.2807 assertions/s.

	7 runs, 49 assertions, 0 failures, 0 errors, 0 skips

----------

Enjoy!