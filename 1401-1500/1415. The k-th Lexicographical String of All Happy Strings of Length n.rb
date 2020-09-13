def dfs(cur)
  return if @arr.size >= @k
  return @arr << cur if cur.size == @n
  %w(a b c).each do |char|
    dfs(cur + char) if cur[-1] != char
  end
end

# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_happy_string(n, k)
  @arr, @n, @k = [], n, k
  dfs("")
  @arr[k-1].to_s
end
