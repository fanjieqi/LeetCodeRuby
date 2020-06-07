AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def mark_distence(i, j)
  queue = []
  @dis[i][j] = 0
  queue << [i, j, true]
  while !queue.empty?
    x, y, flag = queue.shift
    AROUND.each do |dx, dy|
      xx = x + dx
      yy = y + dy
      next if xx < 0 || yy < 0 || xx >= @m || yy >= @n
      next if @dis[xx][yy] && @dis[x][y] + 1 >= @dis[xx][yy]
      @dis[xx][yy] = (flag && @dis[x][y] == 0 && @map[x][y] == 1 && @map[xx][yy] == 1) ? 0 : @dis[x][y] + 1
      if @dis[xx][yy] == 0
        queue.unshift([xx, yy, @map[xx][yy], @dis[xx][yy] == 0])
      else
        queue << [xx, yy, @map[xx][yy], @dis[xx][yy] == 0]
      end
    end
  end
end

# @param {Integer[][]} a
# @return {Integer}
def shortest_bridge(a)
  @map, @m, @n = a, a.size, a[0].size
  @dis = @m.times.map { [] }
  min = 1 << 31
  @map.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      if ele == 1
        if @dis[i][j].nil?
          mark_distence(i, j)
        elsif @dis[i][j] > 1
          min = @dis[i][j] - 1 if @dis[i][j] - 1 < min
        end
      end
    end
  end
  min
end
