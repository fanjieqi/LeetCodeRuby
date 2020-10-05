# @param {Integer[][]} mat
# @return {Integer}
def diagonal_sum(mat)
  n, m, count = mat.size, mat[0].size, 0
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      count += mat[i][j] if i - j == 0 || i + j == m - 1
    end
  end
  count
end
