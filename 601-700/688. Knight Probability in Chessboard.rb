require 'bigdecimal'

STEPS = [
  [ 1,  2],
  [ 1, -2],
  [-1,  2],
  [-1, -2],
  [ 2,  1],
  [ 2, -1],
  [-2,  1],
  [-2, -1],
]

# @param {Integer} n
# @param {Integer} k
# @param {Integer} r
# @param {Integer} c
# @return {Float}
def knight_probability(n, k, r, c)
  return 1 if k == 0
  map = (k+1).times.map { n.times.map { n.times.map { 0 } } }
  map[0][r][c] = BigDecimal(1)
  eight = BigDecimal(8)
  mark = {}
  queue = Queue.new
  queue << [0, r, c]
  while !queue.empty?
    k1, x, y = queue.pop
    STEPS.each do |i, j|
      x1, y1 = x+i, y+j
      next if x1<0 || x1>=n || y1<0 || y1>=n
      map[k1+1][x1][y1] += map[k1][x][y] / eight

      tmp = [k1+1, x1, y1]
      if k1+1 < k && mark[tmp].nil?
        mark[tmp] = true
        queue << tmp
      end
    end
  end

  map[k].flatten.sum.to_f
end
