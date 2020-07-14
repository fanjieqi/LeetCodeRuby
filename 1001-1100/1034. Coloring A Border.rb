AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Integer[][]} grid
# @param {Integer} r0
# @param {Integer} c0
# @param {Integer} color
# @return {Integer[][]}
def color_border(grid, r0, c0, color)
  n, m = grid.size, grid[0].size
  queue, hash, border = Queue.new, {} ,{}
  queue << [r0, c0]
  hash[[r0,c0]] = true
  while !queue.empty?
    x, y = queue.pop
    AROUND.each do |dx, dy|
      xx, yy = x + dx, y + dy
      if 0 <= xx && xx < n && 0 <= yy && yy < m && grid[xx][yy] == grid[x][y]
        if hash[[xx, yy]].nil?
          queue << [xx, yy]
          hash[[xx,yy]] = true
        end
      else
        border[[x, y]] = true
      end
    end
  end
  border.each { |(x, y), _| grid[x][y] = color }
  grid
end
