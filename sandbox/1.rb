# Scratch for winning positions based on NxN board

size = 6
game_board = Array.new(size*size) { |i| "" }

# p game_board  # ["", "", "", "", "", "", "", "", ""]
# p game_board.count  # 9

# get array of board indexes
board_indexes = game_board.each_index.select { |position| game_board[position] }
# p board_indexes
# 3: [0, 1, 2, 3, 4, 5, 6, 7, 8]
# 4: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# 5: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
# 6: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]

# horizontal wins
# create multi-dimensional array of winning horizontal positions
h_wins = board_indexes.each_slice(size).to_a
# p h_wins
# 3: [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
# 4: [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]]
# 5: [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24]]
# 6: [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35]]

# vertical wins
# iterate through top row, then add size, size times
v_wins = []
array_counter = 0
offset_counter = 0
size.times {
  single_v_win = []
  size.times {
    single_v_win.push(board_indexes[offset_counter])
    offset_counter += size
  }
  v_wins.push(single_v_win)
  offset_counter -= board_indexes.count - 1
  array_counter += 1
}
# p v_wins
# 3: [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
# 4: [[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]]
# 5: [[0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24]]
# 6: [[0, 6, 12, 18, 24, 30], [1, 7, 13, 19, 25, 31], [2, 8, 14, 20, 26, 32], [3, 9, 15, 21, 27, 33], [4, 10, 16, 22, 28, 34], [5, 11, 17, 23, 29, 35]]

# diagonal wins
d_wins = []
# top_left diagonal win: start at 0, then add size + 1 each iteration
d_win_1 = []
dw1_position = 0
dw1_offset = size + 1
size.times {
  d_win_1.push(dw1_position)
  dw1_position += dw1_offset
}
d_wins.push(d_win_1)
# top-right diagonal win: start at size - 1, then add size -1 each iteration
d_win_2 = []
dw2_position = size - 1
dw2_offset = size - 1
size.times {
  d_win_2.push(dw2_position)
  dw2_position += dw2_offset
}
d_wins.push(d_win_2)
# p d_wins
# 3: [[0, 4, 8], [2, 4, 6]]
# 4: [[0, 5, 10, 15], [3, 6, 9, 12]]
# 5: [[0, 6, 12, 18, 24], [4, 8, 12, 16, 20]]
# 6: [[0, 7, 14, 21, 28, 35], [5, 10, 15, 20, 25, 30]]

winning_positions = h_wins + v_wins + d_wins
p winning_positions
# 3: [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
# 4: [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
# 5: [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [0, 6, 12, 18, 24], [4, 8, 12, 16, 20]]
# 6: [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35], [0, 6, 12, 18, 24, 30], [1, 7, 13, 19, 25, 31], [2, 8, 14, 20, 26, 32], [3, 9, 15, 21, 27, 33], [4, 10, 16, 22, 28, 34], [5, 11, 17, 23, 29, 35], [0, 7, 14, 21, 28, 35], [5, 10, 15, 20, 25, 30]]
