POS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]
# @param {String[]} board
# @return {Boolean}
def valid_tic_tac_toe(board)
  s = board.join
  o_count, x_count = s.scan("O").count, s.scan("X").count
  return false if o_count > x_count || (x_count - o_count > 1)
  tmp = POS.select { |i, j, k| s[i][/[XO]/] && s[i] == s[j] && s[j] == s[k] }.map{ |i, j, k| s[i]}.uniq
  tmp.count == 0 || tmp.count == 1 && (tmp[0] == "X" && x_count>o_count || tmp[0] == "O" && o_count==x_count)
end
