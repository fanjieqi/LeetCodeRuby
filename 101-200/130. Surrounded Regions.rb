AROUND = [
  [-1, 0],
  [+1, 0],
  [0, -1],
  [0, +1],
]

def solve_margin(board, points, x, y)
  board[x][y] = "1"
  points << [x, y]
  AROUND.each do |i, j|
    xx, yy = x + i, y + j
    next if xx < 0 || yy < 0 || xx >= board.length || yy >= board[0].length
    solve_margin(board, points, xx, yy) if board[xx][yy] == "O"
  end
end

def solve_inner(board, x, y)
  board[x][y] = "X"
  AROUND.each do |i, j|
    xx, yy = x + i, y + j
    next if xx < 0 || yy < 0 || xx >= board.length || yy >= board[0].length
    solve_inner(board, xx, yy) if board[xx][yy] == "O"
  end
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  m = board.length
  return board if m <= 1
  n = board[0].length
  return board if n <= 1

  points = []
  (0..m-1).each do |i|
    solve_margin(board, points, i, 0) if board[i][0] == "O"
    solve_margin(board, points, i, n-1) if board[i][n-1] == "O"
  end
  (0..n-1).each do |i|
    solve_margin(board, points, 0, i) if board[0][i] == "O"
    solve_margin(board, points, m-1, i) if board[m-1][i] == "O"
  end

  (0..m-1).each do |i|
    (0..n-1).each do |j|
      solve_inner(board, i, j) if board[i][j] == "O"
    end
  end

  points.each do |point|
    board[point.first][point.last] = "O"
  end

  board
end
