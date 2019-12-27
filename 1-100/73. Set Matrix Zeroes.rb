# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  row = []
  col = []
  matrix.each_with_index do |ele, i|
    ele.each_with_index do |unit, j|
      if unit == 0
        row[i] = true
        col[j] = true
      end
    end
  end
  matrix.each_with_index do |ele, i|
    ele.each_with_index do |unit, j|
      matrix[i][j] = 0 if row[i] || col[j]
    end
  end
  matrix
end
