# @param {Integer[][]} matrix
# @return {Integer}
def max_equal_rows_after_flips(matrix)
  n, m = matrix.size, matrix[0].size
  matrix.map!(&:join)
  counts = matrix.group_by(&:itself).transform_values(&:count)
  max = counts.values.max
  (0..n-2).each do |i|
    (i+1..n-1).each do |j|
      tmp = counts[matrix[i]] + counts[matrix[j]]
      next if tmp <= max || (0..m-1).any? { |k| matrix[i][k] == matrix[j][k] }
      max = tmp 
    end
  end
  max
end
