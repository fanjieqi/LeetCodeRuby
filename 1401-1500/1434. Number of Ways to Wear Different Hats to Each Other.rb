MOD = 10**9 + 7

def dfs(hat, current)
  return 1 if current == @target
  return 0 if hat > 40
  return @hash[hat][current] if @hash.dig(hat, current)

  @hash[hat] ||= []
  ans = dfs(hat + 1, current)
  @map[hat]&.each do |v|
    next if ((current >> v) & 1) == 1
    ans += dfs(hat + 1, current | (1 << v))
    ans %= MOD
  end
  @hash[hat][current] = ans
end

# @param {Integer[][]} hats
# @return {Integer}
def number_ways(hats)
  n = hats.size
  @map = []
  hats.each_with_index do |arr, i|
    arr.each do |u|
      @map[u] ||= []
      @map[u] << i
    end
  end
  @hash, @target = [], (1 << n) - 1
  dfs(1, 0)
end
