# @param {Integer[][]} mat
# @param {Integer} threshold
# @return {Integer}
def max_side_length(mat, threshold)
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

  l, r = 1, [n, m].min
  while l <= r
    mid = (l + r) / 2
    tmp = 0
    result = (0..n-mid).any? do |i|
      (0..m-mid).any? do |j|
        tmp = sum[i+mid][j+mid] - sum[i][j+mid] - sum[i+mid][j] + sum[i][j]
        tmp <= threshold
      end
    end

    if result
      l = mid + 1
    else
      r = mid - 1
    end
  end
  l-1
end
