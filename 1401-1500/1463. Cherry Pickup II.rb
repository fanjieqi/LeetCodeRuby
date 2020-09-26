# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
  n, m = grid.size, grid[0].size
  f = []
  (0..n-1).each do |x|
    f[x] = []
    (0..m-1).each do |y1|
      f[x][y1] = []
      (0..m-1).each do |y2|
        if x == 0 && y1 == 0 && y2 == m-1
          f[x][y1][y2] = grid[x][y1] + grid[x][y2]
        else
          cur = grid[x][y1] + (y1 == y2 ? 0 : grid[x][y2])
          f[x][y1][y2] = [
            x>0 && y1 > 0 && y2 > 0 && f.dig(x-1, y1-1, y2-1) ? f.dig(x-1, y1-1, y2-1).to_i + cur : nil,
            x>0 && y1 > 0 && y2 >=0 && f.dig(x-1, y1-1, y2  ) ? f.dig(x-1, y1-1, y2  ).to_i + cur : nil,
            x>0 && y1 > 0 && y2<m-1 && f.dig(x-1, y1-1, y2+1) ? f.dig(x-1, y1-1, y2+1).to_i + cur : nil,
            x>0 && y1 >=0 && y2 > 0 && f.dig(x-1, y1  , y2-1) ? f.dig(x-1, y1  , y2-1).to_i + cur : nil,
            x>0 && y1 >=0 && y2 >=0 && f.dig(x-1, y1  , y2  ) ? f.dig(x-1, y1  , y2  ).to_i + cur : nil,
            x>0 && y1 >=0 && y2<m-1 && f.dig(x-1, y1  , y2+1) ? f.dig(x-1, y1  , y2+1).to_i + cur : nil,
            x>0 && y1<m-1 && y2 > 0 && f.dig(x-1, y1+1, y2-1) ? f.dig(x-1, y1+1, y2-1).to_i + cur : nil,
            x>0 && y1<m-1 && y2 >=0 && f.dig(x-1, y1+1, y2  ) ? f.dig(x-1, y1+1, y2  ).to_i + cur : nil,
            x>0 && y1<m-1 && y2<m-1 && f.dig(x-1, y1+1, y2+1) ? f.dig(x-1, y1+1, y2+1).to_i + cur : nil,
          ].compact.max
        end
      end
    end
  end
  f[-1].flatten.compact.max
end
