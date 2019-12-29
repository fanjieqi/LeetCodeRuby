def dfs(hash, l, r)
  return 0 if l > r
  return 1 if l == r
  return hash[r - l + 1] if hash[r - l + 1]
  count = 0
  (l..r).each do |i|
    left = i > l ? dfs(hash, l, i-1) : 1
    right = i < r ? dfs(hash, i+1, r) : 1
    count += left * right
  end
  hash[r - l + 1] = count
  count
end

# @param {Integer} n
# @return {Integer}
def num_trees(n)
  hash = {}
  dfs(hash, 1, n)
end
