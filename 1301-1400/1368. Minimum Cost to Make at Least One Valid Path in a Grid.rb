AROUND = {
  1 => [ 0, +1],
  2 => [ 0, -1],
  3 => [+1,  0],
  4 => [-1,  0],
}

# @param {Integer[][]} grid
# @return {Integer}
def min_cost(grid)
  n, m, map = grid.size, grid[0].size, []
  (0..n-1).each do |x|
    (0..m-1).each do |y|
      u = x * m + y
      map[u] ||= {}
      AROUND.each do |direction, (dx, dy)|
        xx, yy = x + dx, y + dy
        next if xx < 0 || xx >= n || yy < 0 || yy >= m
        v = xx * m + yy
        map[u][v] = grid[x][y] == direction ? 0 : 1
      end
    end
  end

  queue = Queue.new
  queue << 0
  dis = [0]
  while !queue.empty?
    u = queue.pop
    map[u]&.each do |v, value|
      tmp = dis[u] + value
      next if dis[v] && tmp >= dis[v]
      dis[v] = tmp
      queue << v
    end
  end
  dis[n*m - 1]
end
