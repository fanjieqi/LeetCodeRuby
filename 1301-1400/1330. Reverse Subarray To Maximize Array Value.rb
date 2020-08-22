# @param {Integer[]} nums
# @return {Integer}
def max_value_after_reverse(nums)
  n = nums.size
  basic = (0..n-2).inject(0) { |sum, i| sum += (nums[i] - nums[i+1]).abs }
  res, min, max = 0, 1 << 31, -(1 << 31)
  (0..n-2).each do |i|
    tmp = (nums[0] - nums[i+1]).abs - (nums[i] - nums[i+1]).abs
    res = tmp if tmp > res
    tmp = (nums[-1] - nums[i]).abs - (nums[i] - nums[i+1]).abs
    res = tmp if tmp > res

    min = [min, [nums[i], nums[i+1]].max].min
    max = [max, [nums[i], nums[i+1]].min].max
  end
  basic + [res, (max - min) * 2].max
end
