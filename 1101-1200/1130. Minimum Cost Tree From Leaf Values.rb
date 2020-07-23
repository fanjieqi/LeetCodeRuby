def dfs(l, r)
  return 0 if r-l == 0
  return @arr[l] * @arr[r] if r-l == 1
  return @ans[l][r] if @ans.dig(l, r)
  @ans[l] ||= {}
  @max[l] ||= {}

  (l..r-1).each do |i|
    left = dfs(l, i)
    right = dfs(i+1, r)
    @max[l][i] ||= @arr[l..i].max
    @max[i+1] ||= {}
    @max[i+1][r] ||= @arr[i+1..r].max

    tmp = left + right + @max[l][i] * @max[i+1][r]
    @ans[l][r] = tmp if @ans[l][r].nil? || tmp < @ans[l][r]
  end
  @ans[l][r]
end

# @param {Integer[]} arr
# @return {Integer}
def mct_from_leaf_values(arr)
  @arr, @max, @ans = arr, {}, {}
  dfs(0, arr.size-1)
end
