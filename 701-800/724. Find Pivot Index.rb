# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  return -1 if nums.size == 0
  f = []
  nums.each_with_index { |num, i| f[i] = nums[i] + (i == 0 ? 0 : f[i-1])  }
  nums.index.with_index { |num, i| (i == 0 ? 0 : f[i-1]) == (f[-1] - f[i]) } || -1
end
