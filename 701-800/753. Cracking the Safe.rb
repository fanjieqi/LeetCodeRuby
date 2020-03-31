def dfs(str)
  return str if @hash.size == @l
  (@k-1).downto(0) do |suffix|
    ele = str + suffix.to_s
    tmp = ele[-@n..-1]
    if @hash[tmp].nil?
      @hash[tmp] = true
      result = dfs(ele)
      return result if result
      @hash.delete(tmp)
    end
  end
end

# @param {Integer} n
# @param {Integer} k
# @return {String}
def crack_safe(n, k)
  @n, @k, @l = n, k, k**n
  root = "0" * n
  @hash = { root => true }
  dfs(root)
end
