# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  return 0 if prices.size < 2
  ans = 0
  min = prices[0]
  (1..prices.size-1).each do |i|
    if prices[i] < min
      min = prices[i]
    elsif prices[i] > min + fee
      ans += prices[i] - fee - min
      min = prices[i] - fee
    end
  end
  ans
end
