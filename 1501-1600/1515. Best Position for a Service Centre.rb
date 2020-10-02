AROUND = [
  [0, 1],
  [0,-1],
  [1, 0],
  [-1,0],
]

def get_dist_sum(x, y)
  @positions.inject(0) { |sum, (i, j)| sum + Math.sqrt((i-x)**2 + (j-y)**2) }
end

# @param {Integer[][]} positions
# @return {Float}
def get_min_dist_sum(positions)
  @positions, n = positions, positions.size
  x = @positions.inject(0) { |sum, (xx, yy)| sum + xx } / n
  y = @positions.inject(0) { |sum, (xx, yy)| sum + yy } / n
  min = get_dist_sum(x, y)

  step, eps = 10, 0.000001
  while step > eps
    flag = true
    AROUND.each do |dx, dy|
      x2, y2 = x + step * dx, y + step * dy
      tmp = get_dist_sum(x2, y2)
      next if tmp >= min
      x, y, min = x2, y2, tmp
      flag = false
      break
    end
    step /= 2.0 if flag
  end
  min
end
