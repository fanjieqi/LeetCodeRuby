# @param {Integer[]} height
# @return {Integer}
def trap(height)
  sum = 0
  height.pop while height.length > 0 && height.last.zero?
  height.shift while height.length > 0 && height.first.zero?
  len = height.length
  height.each_with_index do |high, i|
    next if i == 0 || i == len - 1
    left = height[0..i-1].max
    right = height[i+1..len-1].max
    sum += [[left, right].min - high, 0].max
  end
  sum
end
