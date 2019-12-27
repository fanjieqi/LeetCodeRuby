# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.length == 0 || matrix.length == 1 && matrix[0].length == 0
  top = 0
  bottom = matrix.length - 1
  x = (top + bottom) / 2
  while top <= bottom
    x = (top + bottom) / 2
    if target > matrix[x].last
      top = x + 1
    elsif target < matrix[x].first
      bottom = x - 1
    else
      break
    end
  end

  left = 0
  right = matrix[x].length - 1
  y = (left + right) / 2
  while left <= right
    y = (left + right) / 2
    if target > matrix[x][y]
      left = y + 1
    elsif target < matrix[x][y]
      right = y - 1
    else
      return true
    end
  end
  false
end
