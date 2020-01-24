# @param {Integer[]} nums
# @return {Integer}
def min_moves(nums)
  nums.sum - nums.size * nums.min
end
