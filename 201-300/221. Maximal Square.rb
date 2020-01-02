def check(matrix, x1, y1, x2, y2)
  (x1..x2).all? do |x|
    (y1..y2).all? do |y|
      matrix[x][y] == '1'
    end
  end
end

# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.length == 0 && matrix
  max = matrix.any? {|row| row.any?{|ele| ele == "1"}} ? 1 : 0
  matrix.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      max += 1 while x + max <= matrix.length - 1 && y + max <= matrix[0].length - 1 && matrix[x][y] == "1" && check(matrix, x, y, x+max, y+max)
    end
  end
  max * max
end
