MOD = 10**9 + 7

def dfs(nums)
  return 1 if nums.size <= 2
  left = nums.select { |num| num < nums[0] }
  right = nums.select { |num| num > nums[0] }
  (1..left.count+right.count).to_a.combination(right.count).size * dfs(left) * dfs(right)
end

# @param {Integer[]} nums
# @return {Integer}
def num_of_ways(nums)
  @nums = nums
  (dfs(nums)-1) % MOD
end
