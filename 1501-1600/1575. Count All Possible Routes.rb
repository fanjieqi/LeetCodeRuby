MOD = 10**9 + 7

def dfs(u, rest)
  return 0 if rest < @cost[u][@finish].to_i
  return @hash[u][rest] if @hash.dig(u, rest)
  @hash[u] ||= {}
  @hash[u][rest] = (0..@n-1).inject(0) { |sum, v| sum + (v!=u ? dfs(v, rest-@cost[u][v]) : 0) } + (u == @finish ? 1 : 0)
end

# @param {Integer[]} locations
# @param {Integer} start
# @param {Integer} finish
# @param {Integer} fuel
# @return {Integer}
def count_routes(locations, start, finish, fuel)
  @n, @locations, @finish, @cost, @hash, = locations.size, locations, finish, [], []

  (0..@n-2).each do |u|
    @cost[u] ||= []
    (u+1..@n-1).each do |v|
      @cost[v] ||= []
      tmp = (locations[u] - locations[v]).abs
      @cost[u][v] = tmp
      @cost[v][u] = tmp
    end
  end

  dfs(start, fuel) % MOD
end
