# @param {Integer[][]} mat
# @return {Integer}
def num_special(mat)
  n, m, row, col, count = mat.size, mat[0].size, [], [], 0
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      next if mat[i][j] == 0
      row[i] = row[i].to_i + 1
      col[j] = col[j].to_i + 1
    end
  end
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      count += 1 if mat[i][j] == 1 && row[i] == 1 && col[j] == 1
    end
  end
  count
end
