# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[][]}
def matrix_block_sum(mat, k)
  n, m = mat.size, mat[0].size
  row_sum, sum = [], []
  sum[0] = (0..m).map { 0 }
  (0..n-1).each do |i|
    row_sum[i] ||= [0]
    sum[i+1] ||= [0]
    (0..m-1).each do |j|
      row_sum[i][j+1] = row_sum[i][j].to_i + mat[i][j]
      sum[i+1][j+1] = sum[i][j+1] + row_sum[i][j+1]
    end
  end

  answer = []
  (0..n-1).each do |i|
    answer[i] ||= [0]
    (0..m-1).each do |j|
      r1, c1 = [i-k+1, 1].max, [j-k+1, 1].max
      r2, c2 = [i+k+1, n].min, [j+k+1, m].min

      tmp = sum[r2][c2] - sum[r1-1][c2] - sum[r2][c1-1] + sum[r1-1][c1-1]
      answer[i][j] = tmp
    end
  end
  answer
end
