# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  return 0 if matrix.length == 0 || matrix[0].length == 0
  points = {}
  m = matrix.length
  n = matrix[0].length

  hash = {}
  max = 0
  matrix.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      x1, y1 = x, y
      next if ele != "1"
      hash[[x,y,x,y]] = true
      max = [max, 1].max
      while matrix[x1 + 1] && matrix[x1+1][y] == "1"
        x1 += 1
        y2 = y
        y2 += 1 while (x..x1).all? { |xx| matrix[xx] && matrix[xx][y2+1] == "1" }
        tmp = (x1 - x + 1) * (y2 - y + 1)
        max = [tmp, max].max
      end
      while matrix[x][y1 + 1] == "1"
        y1 += 1
        x2 = x
        x2 += 1 while (y..y1).all? { |yy| matrix[x2+1] && matrix[x2+1][yy] == "1" }
        tmp = (x2 - x + 1) * (y1 - y + 1)
        max = [tmp, max].max
      end
    end
  end
  max
end
