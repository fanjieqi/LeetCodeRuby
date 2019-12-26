AREA = [
  [1,1,1,2,2,2,3,3,3],
  [1,1,1,2,2,2,3,3,3],
  [1,1,1,2,2,2,3,3,3],
  [4,4,4,5,5,5,6,6,6],
  [4,4,4,5,5,5,6,6,6],
  [4,4,4,5,5,5,6,6,6],
  [7,7,7,8,8,8,9,9,9],
  [7,7,7,8,8,8,9,9,9],
  [7,7,7,8,8,8,9,9,9],
]

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  col = []
  row = []
  area = []
  board.each_with_index do |r, i|
    r.each_with_index do |ele, j|
      next if ele == "."
      row[i] ||= {}
      col[j] ||= {}
      k = AREA[i][j]
      area[k] ||= {}
      return false if row[i][ele] || col[j][ele] || area[k][ele]
      row[i][ele] = true
      col[j][ele] = true
      area[k][ele] = true
    end
  end
  true
end
