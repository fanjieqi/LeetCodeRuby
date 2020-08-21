# @param {Integer[][]} mat
# @return {Integer[][]}
def diagonal_sort(mat)
  n, m, hash = mat.size, mat[0].size, {}
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      hash[i-j] ||= []
      hash[i-j] << mat[i][j]
    end
  end
  hash.transform_values!(&:sort)
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      mat[i][j] = hash[i-j].shift
    end
  end
  mat
end
