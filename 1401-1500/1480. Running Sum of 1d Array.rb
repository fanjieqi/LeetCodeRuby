# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  (0..nums.size-1).map { |i| nums[i] += (i == 0 ? 0 : nums[i-1]) }
end
