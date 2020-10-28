def dfs(l, r)
  return 0 if l >= r
  return @hash[l][r] if @hash.dig(l, r)
  @hash[l] ||= {}
  (l..r).each do |i|
    tmp = [dfs(l, i-1) + i, i + dfs(i+1, r)].max
    @hash[l][r] = tmp if @hash[l][r].nil? || tmp < @hash[l][r]
  end
  @hash[l][r]
end

# @param {Integer} n
# @return {Integer}
def get_money_amount(n)
  @hash = []
  dfs(1, n)
end
