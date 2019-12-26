# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  nums.permutation(nums.length).map(&:to_a).sort.uniq
end
