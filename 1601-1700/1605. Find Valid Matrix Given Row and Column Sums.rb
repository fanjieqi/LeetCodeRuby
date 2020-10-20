# @param {Integer[]} row_sum
# @param {Integer[]} col_sum
# @return {Integer[][]}
def restore_matrix(row_sum, col_sum)
  martrix = []
  (0..row_sum.size-1).each do |i|
    martrix[i] ||= []
    (0..col_sum.size-1).each do |j|
      martrix[i][j] = [row_sum[i], col_sum[j]].min
      row_sum[i] -= martrix[i][j]
      col_sum[j] -= martrix[i][j]
    end
  end
  martrix
end
