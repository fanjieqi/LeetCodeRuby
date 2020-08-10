# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def number_of_subarrays(nums, k)
  indexes = (0..nums.size-1).select { |i| nums[i].odd? }
  (0..indexes.size-k).inject(0) do |sum, i|
    left = (indexes[i+k] ? indexes[i+k] : nums.size) - indexes[i+k-1]
    right = indexes[i] - (i > 0 ? indexes[i-1] : -1)
    sum += left * right
  end
end
