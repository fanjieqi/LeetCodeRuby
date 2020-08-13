AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Character[][]} grid
# @return {Integer}
def min_push_box(grid)
  n, m = grid.size, grid[0].size
  (0..n-1).each do |x|
    (0..m-1).each do |y|
      @tx, @ty = x, y if grid[x][y] == 'T'
      @sx, @sy = x, y if grid[x][y] == 'S'
      @bx, @by = x, y if grid[x][y] == 'B'
    end
  end
  mark = {}
  queue = Queue.new
  queue << [@sx, @sy, @bx, @by, 0, []]
  min = nil
  while !queue.empty?
    sx, sy, bx, by, count = queue.pop
    next if min && count > min
    min = count if bx == @tx && by == @ty && (min.nil? || count < min)
    AROUND.each do |dx, dy|
      sdx, sdy = sx + dx, sy + dy
      next if sdx < 0 || sdx >= n || sdy < 0 || sdy >= m || grid[sdx][sdy] == '#'
      pushed = (sdx == bx && sdy == by)
      bdx, bdy = pushed ? [bx + dx, by + dy] : [bx, by]
      next if bdx < 0 || bdx >= n || bdy < 0 || bdy >= m || grid[bdx][bdy] == '#'
      key = "#{sdx},#{sdy},#{bdx},#{bdy}"
      tmp = pushed ? count + 1 : count
      next if mark[key] && tmp >= mark[key]
      mark[key] = tmp
      queue << [sdx, sdy, bdx, bdy, tmp]
    end
  end
  min || -1
end
