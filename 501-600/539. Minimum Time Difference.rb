MAX = 24 * 60
MIN = 0
# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
  nums = time_points.sort.map do |x|
    h, m = x.split(":")
    h.to_i * 60 + m.to_i
  end
  (0..nums.size-1).map {|i| [MAX - (nums[i] - nums[i-1]).abs, (nums[i] - nums[i-1]).abs].min }.min
end
