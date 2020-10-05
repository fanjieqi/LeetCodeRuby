def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Character[][]} grid
# @return {Boolean}
def contains_cycle(grid)
  n, m = grid.size, grid[0].size
  @father = {}
  (0..n-1).each do |i|
    (0..m-2).each do |j|
      u = i * m + j
      v = u + 1
      fu, fv = get_father(u), get_father(v)
      return true if fu == fv
      @father[fv] = fu if grid[i][j] == grid[i][j+1]
      if grid[i][j] == grid.dig(i+1, j)
        u1 = (i+1) * m + j
        @father[get_father(u1)] = get_father(u)
      end
      if grid[i][j+1] == grid.dig(i+1, j+1)
        v1 = (i+1) * m + j + 1
        @father[get_father(v1)] = get_father(v)
      end
    end
  end
  false
end
