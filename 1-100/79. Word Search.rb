AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

def dfs(board, mark, x, y, word, i)
  # p [x, y, word[i], i]
  mark[x] ||= []
  return true if i == word.length - 1
  AROUND.each do |k, j|
    xx = x + k
    yy = y + j
    next if xx < 0 || yy < 0 || xx >= board.length || yy >= board[0].length
    mark[xx] ||= []
    next if mark[xx][yy] || board[xx][yy] != word[i+1]

    mark[xx][yy] = true
    result = dfs(board, mark, xx, yy, word, i + 1)
    mark[xx][yy] = false

    return true if result
  end
  false
end

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  return false if board.length == 0 || board[0].length == 0
  mark = []

  board.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      mark[x] ||= []
      mark[x][y] = true
      return true if ele == word[0] && dfs(board, mark, x, y, word, 0)
      mark[x][y] = false
    end
  end

  return false
end
