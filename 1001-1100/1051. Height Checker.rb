# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
  ordered = heights.sort
  (0..ordered.size-1).inject(0) { |sum, i| sum += (heights[i] == ordered[i] ?0 : 1) }
end
