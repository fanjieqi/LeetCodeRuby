# @param {Integer[][]} matrix
# @return {Integer}
def count_squares(matrix)
  n, m = matrix.size, matrix[0].size
  row_sum, col_sum, hash = [], [], {}
  hash[1] = {}
  (0..n-1).each do |i|
    row_sum[i] ||= [0]
    (0..m-1).each do |j|
      row_sum[i][j+1] = row_sum[i][j].to_i + matrix[i][j]
      col_sum[j] ||= [0]
      col_sum[j][i+1] = col_sum[j][i].to_i + matrix[i][j]
      hash[1]["#{i},#{j}"] = true if matrix[i][j] == 1
    end
  end
  
  (1..[n,m].max-2).each do |l|
    hash[l+1] ||= {}
    hash[l].each do |key, _|
      x, y = key.split(",").map(&:to_i)
      next if row_sum.dig(x+l, y+l+1).to_i - row_sum.dig(x+l, y).to_i <= l
      next if col_sum.dig(y+l, x+l+1).to_i - col_sum.dig(y+l, x).to_i <= l
      next if matrix.dig(x+l, y+l).to_i == 0
      hash[l+1][key] = true
    end
  end
  hash.map { |l, values| values.size }.sum
end
