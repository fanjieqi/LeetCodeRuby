def process(prices)
  max = prices[-1]
  right_max = []
  (prices.length-2).downto(0) do |i|
    right_max[i] = max > prices[i]
    max = [prices[i], max].max
  end
  right_max[prices.length-1] = true

  min = prices[0]
  left_min = [false]
  (1..prices.length-1).each do |i|
    left_min[i] = min < prices[i]
    min = [prices[i], min].min
  end

  prices.select.with_index {|price, i| left_min[i] || right_max[i] }
end

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length <= 1
  prices = process(prices)

  f = []
  left = []
  (0..prices.length - 1).each do |i|
    f[i] = []
    (i..prices.length-1).each do |j|
      f[i][j] = [prices[j] - prices[i], 0].max
      left[j] = [left[j].to_i, f[i][j]].max
    end
  end

  max = 0
  left.each_with_index do |ele, i|
    left[i] = [max, left[i]].max
    max = left[i]
  end

  max = left[-1]
  (0..prices.length-1).each do |i|
    (i..prices.length-1).each do |j|
      if i > 1
        max = [left[i-1] + f[i][j], max].max
      else
        max = [f[i][j], max].max
      end
    end
  end
  max
end
