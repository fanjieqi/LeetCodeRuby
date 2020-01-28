# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  nums.join.split(/0+/).map(&:length).max.to_i
end
