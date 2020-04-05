# @param {Integer} n
# @param {Integer[][]} mines
# @return {Integer}
def order_of_largest_plus_sign(n, mines)
  map = []
  n.times do |i|
    map[i] = []
    n.times do |j|
      map[i][j] = [i, n-i-1, j, n-j-1].min+1
    end
  end
  mines.each do |x, y|
    n.times do |i|
      tmp = (i - x).abs
      map[i][y] = tmp if tmp < map[i][y]
      tmp = (i - y).abs
      map[x][i] = tmp if tmp < map[x][i]
    end
  end
  map.map(&:max).max
end
