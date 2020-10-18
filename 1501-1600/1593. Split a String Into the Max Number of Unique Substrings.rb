def dfs(i)
  if i == @s.size
    @max = @hash.size if @max.nil? || @hash.size > @max
    return
  end
  (i..@s.size-1).each do |j|
    tmp = @s[i..j]
    next if @hash[tmp]
    @hash[tmp] = true
    dfs(j + 1)
    @hash.delete(tmp)
  end
end

# @param {String} s
# @return {Integer}
def max_unique_split(s)
  @s, @hash, @max = s, {}, 0
  dfs(0)
  @max
end
