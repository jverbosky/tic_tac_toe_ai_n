    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["O", "O", "", "", "", "", "X", "", "X"]
    result = p1.get_move(game.board.get_x, game.board.get_o, "X")
    assert_equal(7, result)

    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "X", "", "O", "X", "", "", "O"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    result = p1.corners.include? move
    assert_equal(true, result)

    size = 3
    game = Game.new(size)
    p1 = PlayerUnbeatable.new(size, game.win.wins)
    game.board.game_board = ["X", "", "", "", "X", "", "", "", "O"]
    move = p1.get_move(game.board.get_x, game.board.get_o, "O")
    force_block = [2, 6]
    result = force_block.include? move
    assert_equal(true, result)



# 4x4
["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
["", "X", "", "O", "", "", "", "X", "", "", "O", "", "", "X", "", ""]

#crash - fixed by tweaking poison method to take last open spots randomly
["O", "X", "O", "O", "X", "X", "X", "O", "", "O", "O", "", "X", "X", "O", "X"]

# unbeatable trying to take occupied position
["O", "", "", "X", "", "", "", "", "", "", "", "", "O", "", "", "X"]

#---------------------------------------------------------------

# 5x5
["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
["", "X", "", "", "", "O", "", "", "", "X", "", "", "", "O", "", "", "", "X", "", "", "X", "", "O", "", ""]

# 6x6
["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
["X", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
["", "X", "", "X", "", "O", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", "", "", "", "", "X", "", "", "", "", "O", ""]


