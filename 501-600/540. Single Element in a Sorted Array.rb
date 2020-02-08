# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate(nums)
  nums.inject(&:^)
end
