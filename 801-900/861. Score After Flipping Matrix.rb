# @param {Integer[][]} a
# @return {Integer}
def matrix_score(a)
  m, n = a.size, a[0].size
  m.times do |i|
    n.times { |j| a[i][j] = 1- a[i][j] } if a[i][0] == 0
  end
  n.times do |j|
    col = (0..m-1).inject(0) { |sum, i| sum += a[i][j] }
    m.times { |i| a[i][j] = 1 - a[i][j] } if col <= m / 2
  end
  a.map { |row| row.join.to_i(2) }.sum
end
