# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  return 0 if heights.length == 0
  max = 0
  len = heights.length

  l_min = [nil]
  1.upto(len-1).each do |i|
    if l_min[i-1]
      l_min[i] = [l_min[i-1], heights[i-1]].min
    else
      l_min[i] = heights[i-1]
    end
  end
  r_min = []
  r_min[len-1] = nil
  (len-2).downto(0).each do |i|
    if r_min[i+1]
      r_min[i] = [r_min[i+1], heights[i+1]].min
    else
      r_min[i] = heights[i+1]
    end
  end

  heights.each_with_index do |height, i|
    next if height * len <= max
    if l_min[i] && l_min[i] >= height
      l = 0
    else
      l = i
      l -= 1 while l - 1 >= 0 && heights[l-1] >= height
    end
    if r_min[i] && r_min[i] >= height
      r = len - 1
    else
      r = i
      r += 1 while r + 1 <= len - 1 && heights[r+1] >= height
    end
    sum = height * (r - l + 1)
    max = [max, sum].max
  end
  max
end

# p largest_rectangle_area([2,1,5,6,2,3])
# p largest_rectangle_area([1,1])
# p largest_rectangle_area((0..10000).to_a)
