# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
  x, y, m, n = 0, 0, matrix.length, matrix[0]&.length||0
  return matrix.flatten if m <= 1 || n <= 1
  up = true
  ans = []
  while x<m-1 || y<n-1
    ans << matrix[x][y]
    if up
      if x > 0 && y < n-1
        x -= 1
        y += 1
      else
        up = !up
        if x == 0 && y == n-1
          x += 1
        elsif x == 0
          y += 1
        elsif y == n-1
          x += 1
        end
      end
    else
      if x < m-1 && y > 0
        x += 1
        y -= 1
      else
        up = !up
        if x == m-1 && y ==0
          y += 1
        elsif y == 0
          x += 1
        elsif x == m - 1
          y += 1
        end
      end
    end
  end
  ans << matrix[x][y]
end
