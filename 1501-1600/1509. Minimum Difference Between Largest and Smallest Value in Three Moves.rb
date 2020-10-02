# @param {Integer[]} nums
# @return {Integer}
def min_difference(nums)
  return 0 if nums.size <= 4
  nums.sort!
  [[0, -4], [1, -3], [2, -2], [3, -1]].map { |l, r| nums[r] - nums[l] }.min
end
