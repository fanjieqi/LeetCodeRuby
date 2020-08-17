# @param {Integer[]} nums
# @return {Integer[]}
def decompress_rl_elist(nums)
  nums.each_slice(2).map { |count, num| [num] * count }.flatten
end
