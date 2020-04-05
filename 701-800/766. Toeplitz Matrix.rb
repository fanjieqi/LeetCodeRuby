# @param {Integer[][]} matrix
# @return {Boolean}
def is_toeplitz_matrix(matrix)
  hash = {}
  matrix.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      if hash[i-j].nil?
        hash[i-j] = ele
      elsif hash[i-j] != ele
        return false
      end
    end
  end
  true
end
