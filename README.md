## Tic Tac Toe N ##

A web app developed using Ruby, Sinatra, HTML, CSS and JavaScript.

Highlights include:

1. A mobile device friendly UI.
2. Support for human versus human on board sizes from 3x3 up to 12x12.
3. Player move validation.
4. Cumulative scoring for multiple games.

----------

## Gameplay ##

Please refer to the following sections for details on how to run and play the game:

- Running the Game
- Player Selection
- Move Selection
- Cumulative Scoring

----------

**Running the Game**

----------

To open the game from any Internet-connected device, use the following URL:

[https://tic-tac-toe-n-jv.herokuapp.com/](https://tic-tac-toe-n-jv.herokuapp.com/)

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

**Board Size Selection**

----------

1. On the initial screen, use the drop-down to specify the desired board size.  Sizes range from 3 x 3 up to 12 x 12.
2. Click the **Submit** button.

----------

**Playing the Game**

----------

1. Player X selects a desired board space by clicking or tapping on it.
2. Player O selects a desired board space by clicking or tapping on it.
3. Continue taking turns until a player wins or the game ends in a tie.

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

- **test\_board_n.rb** > **/board/board.rb** (17 tests)
- **test\_game_n.rb** > **/game/game.rb** (29 tests)
- **test\_messaging_n.rb** > **/game/messaging.rb** (13 tests)
- **test\_win_n.rb** > **/game/win.rb** (68 tests)

Front-End Tests:

- **test_app_n.rb** > **/app.rb** (4 tests, 30 assertions)

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

	`ruby test_app_n.rb`

The resulting output will indicate the success of the front-end tests and assertions:

	Run options: --seed 3557

	# Running:

	....

	Finished in 0.107661s, 37.1536 runs/s, 278.6523 assertions/s.

	4 runs, 30 assertions, 0 failures, 0 errors, 0 skips

----------

Enjoy!