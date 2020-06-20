def dfs(target)
  return @hash[target] if @hash[target]

  tmp, count = @x, 0
  while tmp < target
    count += 1
    tmp *= @x
  end

  count1 = 1 << 31
  if tmp == target
    count1 = count
  elsif (tmp - target < target)
    count1 = count + dfs(tmp - target) + 1
  end
  
  count2 = 1 << 31
  tmp /= @x
  count2 = dfs(target - tmp) + (count == 0 ? 2 : count)
  min = [count1, count2].min
  @hash[target] = min
end

# @param {Integer} x
# @param {Integer} target
# @return {Integer}
def least_ops_express_target(x, target)
  @hash = {0 => 1, 1 => 1, x => 0}
  @x, @target = x, target
  dfs(target)
end
