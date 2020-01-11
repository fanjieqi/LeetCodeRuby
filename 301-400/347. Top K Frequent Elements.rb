# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  tmp = nums.group_by(&:itself).transform_values(&:count).sort_by(&:last).reverse
  tmp[0..k-1].map(&:first)
end
