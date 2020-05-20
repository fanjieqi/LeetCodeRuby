# @param {Integer} g
# @param {Integer} p
# @param {Integer[]} group
# @param {Integer[]} profit
# @return {Integer}
def profitable_schemes(g, p, group, profit)
  f = (0..p+1).map { (0..g+1).map { 0 } }
  f[0][0] = 1
  profit.size.times do |k|
    p.downto(0) do |i|
      (g-group[k]).downto(0) do |j|
        f[[i + profit[k], p].min][j + group[k]] += f[i][j]
      end
    end
  end
  f[p].sum % (10**9 + 7)
end
