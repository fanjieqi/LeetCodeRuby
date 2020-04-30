MAX = 2 << 31
def dfs(a, b)
  return 0 if a == b
  return @hash[a + b] if @hash[a + b]
  i = (0..a.size-1).find { |i| a[i] != b[i] }
  min = MAX
  (i..a.size).each do |j|
    next if a[j] != b[i]
    a[i], a[j] = a[j], a[i]
    tmp = dfs(a[i+1..-1], b[i+1..-1]) + 1
    a[i], a[j] = a[j], a[i]
    min = tmp if tmp < min
  end
  @hash[a + b] ||= min
end

# @param {String} a
# @param {String} b
# @return {Integer}
def k_similarity(a, b)
  @hash = {}
  dfs(a, b)
end
