# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  nums = nums.uniq.sort.reverse
  nums[2] || nums[0]
end
