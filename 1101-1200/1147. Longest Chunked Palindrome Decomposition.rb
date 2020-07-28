def dfs(l, r)
  return @hash[l][r] if @hash.dig(l, r)
  @hash[l] ||= {}
  @hash[l][r] = 1
  (1..(r-l+1)/2).each do |i|
    next if @text[l, i] != @text[r-i+1..r]
    tmp = (l+i == r-i+1) ? 2 : dfs(l+i, r-i) + 2
    @hash[l][r] = tmp if tmp > @hash[l][r]
  end
  @hash[l][r]
end

# @param {String} text
# @return {Integer}
def longest_decomposition(text)
  @text, @hash = text, {}
  dfs(0, text.size-1)
end
