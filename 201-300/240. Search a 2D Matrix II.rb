# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.length == 0 || matrix[0].length == 0
  x = 0
  y = matrix[0].length - 1
  while x <= matrix.length - 1 && y >= 0
    if matrix[x][y] > target
      y -= 1
    elsif matrix[x][y] < target
      x += 1
    else
      return true
    end
  end
  false
end
