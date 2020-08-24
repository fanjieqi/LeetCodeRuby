AROUND = [
  [-1, -1],
  [-1,  1],
  [ 0, -1],
  [ 0, +1],
  [ 1, -1],
  [ 1,  1],
]

def dfs(i, j)
  AROUND.each do |dx, dy|
    x, y = i + dx, j + dy
    next if x < 0 || x >= @n || y < 0 || y >= @m || @seats[x][y] == '#' || @mark.dig(x, y)
    @mark[x] ||= {}
    @mark[x][y] = true
    if @match.dig(x, y).nil? || dfs(@match[x][y] / @m, @match[x][y] % @m)
      @match[x] ||= {}
      @match[x][y] = i * @m + j
      @match[i] ||= {}
      @match[i][j] = x * @m + y
      return true
    end
  end
  false
end

def hungarian()
  count = 0
  (0..@n-1).each do |i|
    (0..@m-1).each do |j|
      next if @seats[i][j] == '#' || @match.dig(i, j)
      @mark = {}
      count += dfs(i, j) ? 1 : 0
    end
  end
  count
end

# @param {Character[][]} seats
# @return {Integer}
def max_students(seats)
  @n, @m, @seats = seats.size, seats[0].size, seats
  @match = {}
  seats.join.scan('.').count - hungarian()
end
