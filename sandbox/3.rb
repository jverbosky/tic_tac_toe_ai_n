# size = 3
# wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
# corners = [0, 2, 6, 8]

# size = 4
# wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
# corners = [0, 3, 12, 15]

# size = 5
# wins = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [0, 6, 12, 18, 24], [4, 8, 12, 16, 20]]
# corners = [0, 4, 20, 24]

# size = 6
# wins = [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35], [0, 6, 12, 18, 24, 30], [1, 7, 13, 19, 25, 31], [2, 8, 14, 20, 26, 32], [3, 9, 15, 21, 27, 33], [4, 10, 16, 22, 28, 34], [5, 11, 17, 23, 29, 35], [0, 7, 14, 21, 28, 35], [5, 10, 15, 20, 25, 30]]
# corners = [0, 5, 30, 35]

top = wins.values_at(0)[0]
# p top  # 3 - [0, 1, 2], 6 - [0, 1, 2, 3, 4, 5]
t_edges = top - corners
p t_edges

bottom = wins.values_at(size - 1)[0]
# p bottom  # 3 - [6, 7, 8], 6 - [30, 31, 32, 33, 34, 35]
b_edges = bottom - corners
p b_edges

left = wins.values_at(size)[0]
# p left  # 3 - [0, 3, 6], 6 - [0, 6, 12, 18, 24, 30]
l_edges = left - corners
p l_edges

right = wins.values_at(size * 2 - 1)[0]
# p right  # 3 - [2, 5, 8], 6 - [5, 11, 17, 23, 29, 35]
r_edges = right - corners
p r_edges