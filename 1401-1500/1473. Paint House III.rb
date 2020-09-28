# @param {Integer[]} houses
# @param {Integer[][]} cost
# @param {Integer} m
# @param {Integer} n
# @param {Integer} target
# @return {Integer}
def min_cost(houses, cost, m, n, target)
  f = [[(0..n).map{0}]]
  (1..m).each do |i|
    house = houses[i-1]
    f[i] ||= []
    (1..target).each do |j|
      f[i][j] ||= []
      range = house > 0 ? (house..house) : (1..n)
      range.each do |k|
        (1..n).each do |l|
          if k == l
            next if f.dig(i-1, j, l).nil?
            tmp = f[i-1][j][l] + (house > 0 ? 0 : cost[i-1][k-1])
          else
            next if f.dig(i-1, j-1, l).nil?
            tmp = f[i-1][j-1][l] +  (house > 0 ? 0 : cost[i-1][k-1])
          end
          f[i][j][k] = tmp if f[i][j][k].nil? || tmp < f[i][j][k]
        end
      end
    end
  end
  f[m][target].flatten.compact.min || -1
end
