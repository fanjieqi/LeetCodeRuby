# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  nums.permutation(nums.length).map(&:to_a)
end
