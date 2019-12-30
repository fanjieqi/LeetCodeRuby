# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length <= 1
  sum = 0
  max = prices[0]
  min = prices[0]
  prices << 0
  prices[1..-1].each do |price|
    if price < max
      sum += max - min
      min = price
      max = price
    else
      max = price
    end
  end
  sum
end
