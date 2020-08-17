# @param {String} s
# @return {Integer}
def min_insertions(s)
  n, r, f = s.size, s.reverse, []
  (0..n-1).each do |i|
    f[i] = []
    (0..n-1).each do |j|
      if s[i] == r[j]
        f[i][j] = (i > 0 && j > 0 ? f[i-1][j-1] : 0) + 1
      else
        f[i][j] = [i > 0 ? f[i-1][j] : 0, j > 0 ? f[i][j-1] : 0].max
      end
    end
  end
  n - f[-1][-1]
end
