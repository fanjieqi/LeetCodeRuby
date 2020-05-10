AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def bfs(x, y, count, state)
  queue = Queue.new
  queue << [x, y, count, state]
  @hash[x] ||= []
  @hash[x][y] ||= {}
  @hash[x][y][state] = count
  while !queue.empty?
    x, y, count, state = queue.pop

    current = @grid[x][y]
    state[current] = true if current[/[[:lower:]]/] && state[current].nil?

    return count if state.size == @num

    count += 1
    AROUND.each do |i, j|
      xx = x + i
      yy = y + j
      next if xx < 0 || yy < 0 || xx >= @m || yy >= @n
      tmp = @grid[xx][yy]
      next if tmp == '#' || tmp[/[[:upper:]]/] && state[tmp.downcase].nil?

      if @hash.dig(xx, yy, state).nil?
        @hash[xx] ||= []
        @hash[xx][yy] ||= {}
        @hash[xx][yy][state] = count
        queue << [xx, yy, count, state.clone]
      end
    end
  end
  -1
end

# @param {String[]} grid
# @return {Integer}
def shortest_path_all_keys(grid)
  @grid, @m, @n = grid, grid.size, grid[0].size
  @num, @hash =  0, []
  x, y = nil, nil
  @m.times do |i|
    @n.times do |j|
      tmp = @grid[i][j]
      if tmp == '@'
        x, y = i, j
      elsif tmp[/[[:lower:]]/]
        @num += 1
      end
    end
  end
  bfs(x, y, 0, {})
end
