# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  return [] if triangle.length == 0
  (1..triangle.length-1).each do |i|
    (0..i).each do |j|
      if j == 0
        triangle[i][j] = triangle[i-1][j] + triangle[i][j]
      elsif j == i
        triangle[i][j] = triangle[i-1][j-1] + triangle[i][j]
      else
        triangle[i][j] = [triangle[i-1][j-1], triangle[i-1][j]].min + triangle[i][j]
      end
    end
  end
  triangle.last.min
end
