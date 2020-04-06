# @param {Integer[][]} board
# @return {Integer}
def moves_to_chessboard(board)
  n = board.size
  return 0 if n<=1

  counter = board.group_by(&:itself).transform_values(&:count)
  keys = counter.keys

  return -1 if keys.size !=2 ||
               (counter[keys[0]]-counter[keys[1]]).abs > 1 ||
               (keys[0].count(1)-keys[0].count(0)).abs > 1 ||
               (0..n-1).any? { |i| keys[0][i] == keys[1][i] }

  rowdiff = (0..n-1).select { |i| board[0][i] != (i%2) }.count
  coldiff = (0..n-1).select { |i| board[i][0] != (i%2) }.count
  rowdiff = rowdiff%2 != 0 || (n%2==0 && (n-rowdiff)<rowdiff) ? n-rowdiff : rowdiff
  coldiff = coldiff%2 != 0 || (n%2==0 && (n-coldiff)<coldiff) ? n-coldiff : coldiff
  (rowdiff+coldiff)/2
end
