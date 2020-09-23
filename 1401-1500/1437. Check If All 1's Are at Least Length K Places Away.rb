# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def k_length_apart(nums, k)
  indexes = (0..nums.size-1).select { |i| nums[i] == 1 }
  (0..indexes.size-2).all? { |i| indexes[i+1] - indexes[i] > k }
end
