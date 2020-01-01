class WordDictionary
  attr_accessor :childs, :isend

  def initialize()
    @childs = {}
  end

  def add_word(word)
    @childs[word[0]] ||= WordDictionary.new
    @childs[word[0]].isend ||= word.length == 1
    @childs[word[0]].add_word(word[1..-1]) if word.length > 1
  end
end

AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

def dfs(ans, node, board, x, y, word = "")
  return if x<0 || y<0 || x>=board.length || y>=board[0].length || board[x][y] == "."
  return if node.childs[board[x][y]].nil?

  word += board[x][y]
  node = node.childs[board[x][y]]
  if node.isend
    ans << word
    node.isend = false
  end

  ori = board[x][y]
  board[x][y] = "."
  AROUND.each { |i, j| dfs(ans, node, board, x+i, y+j, word) }
  board[x][y] = ori
end

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  return [] if words.length == 0
  max_length = words.map(&:length).max

  dict = WordDictionary.new
  words.each { |word| dict.add_word(word) }

  ans = []
  board.each_with_index do |row, x|
    row.each_with_index do |char, y|
      dfs(ans, dict, board, x, y)
    end
  end
  ans
end
