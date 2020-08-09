AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def dfs(u, count)
  @mark[u] = true
  @ans = count if count > @ans
  @map[u]&.each do |v|
    next if @mark[v]
    dfs(v, count + @hash[v])
  end
  @mark[u] = false
end

# @param {Integer[][]} grid
# @return {Integer}
def get_maximum_gold(grid)
  n, m, @map, @hash = grid.size, grid[0].size, {}, {}
  (0..n-1).each do |x|
    (0..m-1).each do |y|
      next if grid[x][y] == 0
      u = "#{x},#{y}"
      @map[u] ||= []
      @hash[u] = grid[x][y]
      AROUND.each do |dx, dy|
        xx, yy = x + dx, y + dy
        next if xx < 0 || xx >= n || yy < 0 || yy >= m || grid[xx][yy] == 0
        v = "#{xx},#{yy}"
        @map[u] << v
      end
    end
  end

  @ans, @mark = 0, {}
  @map.each { |u, _| dfs(u, @hash[u]) }
  @ans
end
