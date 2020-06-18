AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {String[]} grid
# @return {Integer}
def regions_by_slashes(grid)
  @father = []

  n, m = grid.size, grid[0].size
  (0..n-1).each do |x|
    (0..m-1).each do |y|
      u = (x*n+y)*4
      l, d, r = u+1, u+2, u+3

      if grid[x][y] == "/"
        @father[get_father(l)] = get_father(u)
        @father[get_father(r)] = get_father(d)
      elsif grid[x][y] == "\\"
        @father[get_father(r)] = get_father(u)
        @father[get_father(l)] = get_father(d)
      else
        @father[get_father(l)] = get_father(u)
        @father[get_father(d)] = get_father(u)
        @father[get_father(r)] = get_father(u)
      end

      AROUND.each do |dx, dy|
        xx = x + dx
        yy = y + dy
        next if xx < 0 || yy < 0 || xx >= n || yy >= m

        u1 = (xx*n+yy)*4
        l1, d1, r1 = u1+1, u1+2, u1+3
        case u1 - u
        when  4   then @father[get_father(l1)] = get_father(r)
        when -4   then @father[get_father(r1)] = get_father(l)
        when  4*m then @father[get_father(u1)] = get_father(d)
        when -4*m then @father[get_father(d1)] = get_father(u)
        end
      end
    end
  end
  (0..(n*m)*4-1).map(&method(:get_father)).uniq.count
end
