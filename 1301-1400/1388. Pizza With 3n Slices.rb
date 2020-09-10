MAX = 1 << 31

def dfs(i, j, k, cycle=0)
  return @slices[i..j].max if k == 1
  return -MAX if j-i+1 < k*2-1
  key = "#{i},#{j},#{k},#{cycle}"
  return @hash[key] if @hash[key]
  @hash[key] = [dfs(i+cycle, j-2, k-1) + @slices[j], dfs(i, j-1, k)].max
end

# @param {Integer[]} slices
# @return {Integer}
def max_size_slices(slices)
  @slices, @hash = slices, {}
  dfs(0, slices.size-1, slices.size/3, 1)
end
