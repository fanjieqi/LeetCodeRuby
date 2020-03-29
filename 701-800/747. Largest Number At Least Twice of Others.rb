# @param {Integer[]} nums
# @return {Integer}
def dominant_index(nums)
  i = nums.index(nums.max)
  nums.all? { |num| num == nums[i] || num * 2 <= nums[i] } ? i : -1
end
