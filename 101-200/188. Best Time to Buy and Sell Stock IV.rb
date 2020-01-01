MAX = 1 << 31
# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  return 0 if prices.length == 0 || k == 0
  return (1..prices.length-1).inject(0) { |sum, i| sum += [0, prices[i]-prices[i - 1]].max } if (k >= prices.size() / 2)

  cash = [-MAX] * (k + 1)
  asset = []
  prices.each do |price|
    (1..k+1).each do |i|
      cash[i] = [cash[i].to_i, asset[i-1].to_i-price].max
			asset[i] = [asset[i].to_i, cash[i].to_i+price].max
    end
  end
  asset[k]
end
