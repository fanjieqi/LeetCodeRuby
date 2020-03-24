# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def find_length(a, b)
  f = []
  max = 0
  (0..a.length-1).each do |i|
    f[i] = []
    (0..b.length-1).each do |j|
      next if a[i] != b[j]
      f[i][j] = (i > 0 && j > 0 && a[i-1] == b[j-1]) ? f[i-1][j-1].to_i + 1 : 1
      max = f[i][j] if f[i][j] > max
    end
  end
  max
end
