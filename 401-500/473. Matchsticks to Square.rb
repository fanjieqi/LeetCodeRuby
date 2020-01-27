def dfs(rest, depth, k)
  return true if rest == 0 && depth == 3 && k == @all
  return @hash[k] unless @hash[k].nil?
  if rest > 0
    @hash[k] = (0..@nums.length-1).any? { |i| (k&(1<<i)).zero? && rest>=@nums[i] && dfs(rest-@nums[i], depth, k|(1<<i)) }
  else
    @hash[k] = (0..@nums.length-1).any? { |i| (k&(1<<i)).zero? && dfs(@length-@nums[i], depth+1, k|(1<<i)) }
  end
end

# @param {Integer[]} nums
# @return {Boolean}
def makesquare(nums)
  sum = nums.sum
  return false if sum % 4 != 0
  @hash = {}
  @nums = nums.sort.reverse
  @all = ("1" * @nums.length).to_i(2)
  @length = sum / 4
  dfs(@length, 0, 0)
end
