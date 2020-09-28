# @param {Integer[]} prices
# @return {Integer[]}
def final_prices(prices)
  prices.map.with_index do |price, i|
    j = (i+1..prices.size-1).find { |k| prices[k] <= price }
    price - (j ? prices[j] : 0)
  end
end
