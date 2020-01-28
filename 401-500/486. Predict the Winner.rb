def dfs(i, j)
  if @hash[[i,j]].nil?
    return @nums[i] if i == j
    @hash[[i,j]] = [@nums[i]-dfs(i+1, j), @nums[j]-dfs(i, j-1)].max
  end
  @hash[[i,j]]
end


# @param {Integer[]} nums
# @return {Boolean}
def predict_the_winner(nums)
  @nums = nums
  @hash = {}
  dfs(0, @nums.length-1) >= 0
end
