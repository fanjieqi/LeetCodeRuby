# @param {Integer[]} nums
# @return {Integer}
def find_lhs(nums)
  return 0 if nums.size == 0
  hash = nums.group_by(&:itself).transform_values(&:size)
  hash.keys.map { |key| hash[key+1].nil? ? 0 : hash[key] + hash[key+1] }.max
end
