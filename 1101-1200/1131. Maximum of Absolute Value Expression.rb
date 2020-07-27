CORNERS = [
  [1,  1],
  [1, -1],
  [-1, 1],
  [-1,-1],
]

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def max_abs_val_expr(arr1, arr2)
  max = 0
  CORNERS.each do |dx, dy|
    closest = dx * arr1[0] + dy * arr2[0]
    (0..arr1.size-1).each do |i|
      cur = dx * arr1[i] + dy * arr2[i] + i
      tmp = cur - closest
      max = cur - closest if tmp > max
      closest = cur if cur < closest
    end
  end
  max
end
