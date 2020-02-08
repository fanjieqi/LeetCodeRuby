AROUND = [[-1, 0], [1, 0], [0, 1], [0, -1], [-1, 1], [-1, -1], [1, 1], [1, -1]]
# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
  x, y = click
  if 0 <= x && x < board.length && 0 <= y && y < board[0].length
    if board[x][y] == 'M'
      board[x][y] = 'X'
    elsif board[x][y] == 'E'
      n = AROUND.select { |r, c| 0 <= x+r && x+r < board.length && 0 <= y+c && y+c < board[0].length && board[x+r][y+c] == 'M'} .size
      board[x][y] = n > 0 ? n.to_s : 'B'
      AROUND.each { |r,c| update_board(board, [x+r, y+c]) } if n == 0
    end
  end
  board
end
