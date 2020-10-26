AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

# @param {Integer[][]} heights
# @return {Integer}
def minimum_effort_path(heights)
  n, m, dist = heights.size, heights[0].size, [[0]]
  queue = Queue.new
  queue << [0, 0]
  while !queue.empty?
    x, y = queue.pop
    AROUND.each do |dx, dy|
      xx = x + dx
      yy = y + dy
      next if xx < 0 || xx >= n || yy < 0 || yy >= m
      tmp = (heights[xx][yy] - heights[x][y]).abs
      tmp = dist[x][y] if dist[x][y] > tmp
      dist[xx] ||= []
      next if dist.dig(xx, yy) && tmp >= dist[xx][yy]
      dist[xx][yy] = tmp
      queue << [xx, yy]
    end
  end
  dist[n-1][m-1]
end
