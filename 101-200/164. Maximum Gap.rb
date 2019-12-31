# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  return 0 if nums.length < 2
  nums.sort!.map.with_index { |num, i| (i < nums.length - 1) ? nums[i+1] - num : 0}.max
end
