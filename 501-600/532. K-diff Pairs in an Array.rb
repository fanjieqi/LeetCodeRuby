# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_pairs(nums, k)
  return 0 if k < 0
  hash = nums.group_by(&:itself).transform_values(&:count)
  return hash.select{|k, v| v >= 2}.count if k == 0
  nums.map {|num| hash[num-k] ? [num, num-k] : nil }.uniq.compact.count
end
