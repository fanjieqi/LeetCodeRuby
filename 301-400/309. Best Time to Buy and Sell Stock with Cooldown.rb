# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length == 0
  f = []
  (0..prices.length-1).each do |i|
    f[i] = 0
    (0..i-1).each do |j|
      if prices[j] >= prices[i]
        f[i] = [f[i], f[j]].max
      elsif j <= 1
        f[i] = [prices[i] - prices[j], f[i]].max
      else
        f[i] = [prices[i] - prices[j] + f[j-2], f[i]].max
      end
    end
  end
  f.max
end
