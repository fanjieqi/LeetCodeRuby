MAX = 1 << 31

def dfs(amount)
  return 0 if amount == 0
  return -1 if amount < @min_coin
  return @hash[amount] if @hash[amount]

  min = MAX
  @coins.each do |coin|
    tmp = dfs(amount - coin)
    next if tmp == -1
    min = [min, tmp + 1].min
  end
  @hash[amount] = min
  min
end

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  return -1 if coins.length == 0
  return 0 if amount == 0
  @coins = coins.sort.reverse
  @min_coin = @coins.min
  @hash = {}

  min = MAX
  @coins.each do |coin|
    tmp = dfs(amount - coin)
    next if tmp == -1
    min = [min, tmp + 1].min
  end
  min == MAX ? -1 : min
end
