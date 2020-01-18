# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
  return 0 if board.length == 0
  count = 0
  board.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      count += 1 if board[i][j] == 'X' && (i == 0 || board[i-1][j] == '.') && (j == 0 || board[i][j-1] == '.')
    end
  end
  count
end
