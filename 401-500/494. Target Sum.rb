def dfs(i, s)
  return s == 0 ? 1 : 0 if i == -1
  return @hash[[i,s]] if @hash[[i,s]]
  @hash[[i,s]] = dfs(i-1, s-@nums[i]) + dfs(i-1,s+@nums[i])
end

# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
  @hash = {}
  @nums = nums
  dfs(nums.length-1, s)
end
