def dfs(i = -1)
  if i >= 0
    @mark[i] = true
    @cur << @arr[i]
    @arr[i].each_char { |char| @hash[char] = true }
  end
  @ans = @cur.size if @cur.size > @ans

  (i+1..@arr.size-1).each do |j|
    next if @mark[j] || @arr[j].chars.uniq.size < @arr[j].size || @arr[j].chars.any? { |char| @hash[char] }
    dfs(j)
  end

  if i >= 0
    @mark[i] = false
    @cur = @cur[0..(-@arr[i].size-1)]
    @arr[i].each_char { |char| @hash.delete(char) }
  end
end

# @param {String[]} arr
# @return {Integer}
def max_length(arr)
  @arr, @mark, @cur, @ans, @hash = arr, {}, '', 0, {}
  dfs()
  @ans
end
