# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def max_uncrossed_lines(a, b)
  f = []
  (0..a.size-1).each do |i|
    f[i] = []
    (0..b.size-1).each do |j|
      if a[i] == b[j]
        f[i][j] = (i > 0 && j > 0 ? f[i-1][j-1] : 0) + 1
      else
        f[i][j] = [i > 0 ? f[i-1][j] : 0, j > 0 ? f[i][j-1] : 0].max
      end
    end
  end
  f[-1][-1]
end
