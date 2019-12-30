# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length <= 1
  min = prices[0]
  max = 0
  prices[1..-1].each do |price|
    max = [price - min, max].max
    min = [price, min].min
  end
  max
end
