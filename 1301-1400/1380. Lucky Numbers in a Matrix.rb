MAX = 1 << 31
# @param {Integer[][]} matrix
# @return {Integer[]}
def lucky_numbers(matrix)
  n, m, row, col = matrix.size, matrix[0].size, [], []
  (0..n-1).each do |i|
    row[i] ||= MAX
    (0..m-1).each do |j|
      col[j] ||= 0
      row[i] = matrix[i][j] if matrix[i][j] < row[i]
      col[j] = matrix[i][j] if matrix[i][j] > col[j]
    end
  end
  ans = []
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      ans << matrix[i][j] if matrix[i][j] == row[i] && matrix[i][j] == col[j]
    end
  end
  ans
end
