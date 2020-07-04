AROUND = [
  [0,  0],
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 1],
  [1, -1],
  [-1,+1],
  [-1,-1],
]

# @param {Integer} n
# @param {Integer[][]} lamps
# @param {Integer[][]} queries
# @return {Integer[]}
def grid_illumination(n, lamps, queries)
  row, col, lr, rl, hash = {}, {}, {}, {}, {}
  lamps.each do |x, y|
    row[x] = row[x].to_i + 1
    col[y] = col[y].to_i + 1
    lr[x-y] = lr[x-y].to_i + 1
    rl[x+y] = rl[x+y].to_i + 1
    hash[x] ||= {}
    hash[x][y] = true
  end
  queries.map do |x, y|
    ans = (row[x].to_i > 0 || col[y].to_i > 0 || lr[x-y].to_i > 0 || rl[x+y].to_i > 0) ? 1 : 0

    AROUND.each do |dx, dy|
      xx, yy = x + dx, y + dy
      next if xx < 0 || xx >= n || yy < 0 || yy >= n || hash.dig(xx, yy).nil?
      row[xx] -= 1
      col[yy] -= 1
      lr[xx-yy] -= 1
      rl[xx+yy] -= 1
      hash[xx].delete(yy)
    end

    ans
  end
end
