# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  map = []
  matrix.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      map[i] ||= []
      map[i][j] = matrix[i][j]
    end
  end

  num = matrix.length - 1
  left, right, top, bottom = 0, num, 0, num
  while left < right && top < bottom
    if (right - left == 1) && (bottom - top == 1)
      matrix[top][right] = map[top][left]
      matrix[bottom][right] = map[top][right]
      matrix[bottom][left] = map[bottom][right]
      matrix[top][left] = map[bottom][left]
    elsif (right - left > 1) && (bottom - top > 1)
      (left..right).each do |i|
        j = left + right - i
        matrix[i][right] = map[top][i]
        matrix[bottom][j] = map[i][right]
        matrix[j][left] = map[bottom][j]
        matrix[top][i] = map[j][left]
      end
    end
    top += 1
    bottom -=1
    left +=1
    right -= 1
  end
  matrix
end
