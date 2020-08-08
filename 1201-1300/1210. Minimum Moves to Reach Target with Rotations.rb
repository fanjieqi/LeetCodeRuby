HORIZONTAL = 0
VERTICAL = 1
# @param {Integer[][]} grid
# @return {Integer}
def minimum_moves(grid)
  n, m = grid.size, grid[0].size

  horizontal, vertical = [], []
  horizontal[0] = []
  horizontal[0][1] = 0

  queue = Queue.new
  queue << [0, 1, HORIZONTAL]
  while !queue.empty?
    i, j, direction = queue.pop
    horizontal[i] ||= []
    horizontal[i+1] ||= []
    vertical[i] ||= []
    vertical[i+1] ||= []

    if direction == HORIZONTAL 
      if grid[i][j+1] == 0 && horizontal[i][j+1].nil?
        horizontal[i][j+1] = horizontal[i][j] + 1
        queue << [i, j+1, HORIZONTAL]
      end

      if grid[i+1] && grid[i+1][j-1] == 0 && grid[i+1][j] == 0 && horizontal[i+1][j].nil?
        horizontal[i+1][j] = horizontal[i][j] + 1
        queue << [i+1, j, HORIZONTAL]
      end

      if grid[i+1] && grid[i+1][j] == 0 && grid[i+1][j-1] == 0 && vertical[i+1][j-1].nil?
        vertical[i+1][j-1] = horizontal[i][j] + 1
        queue << [i+1, j-1, VERTICAL]
      end
    end

    if direction == VERTICAL 
      if grid[i+1] && grid[i+1][j] == 0 && vertical[i+1][j].nil?
        vertical[i+1][j] = vertical[i][j] + 1
        queue << [i+1, j, VERTICAL]
      end

      if i > 0 && grid[i-1][j+1] == 0 && grid[i][j+1] == 0 && vertical[i][j+1].nil?
        vertical[i][j+1] = vertical[i][j] + 1
        queue << [i, j+1, VERTICAL]
      end

      if grid[i-1] && grid[i][j+1] == 0 && grid[i-1][j+1] == 0 && horizontal[i-1][j+1].nil?
        horizontal[i-1][j+1] = vertical[i][j] + 1
        queue << [i-1, j+1, HORIZONTAL]
      end
    end

  end

  horizontal.dig(n-1, m-1) || -1
end
