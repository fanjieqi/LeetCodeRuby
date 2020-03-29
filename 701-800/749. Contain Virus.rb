AROUND = [
  [ 1,  0],
  [ 0,  1],
  [-1,  0],
  [ 0, -1],
]

def get_virus_areas()
  areas, dangers, walls = [], [], []
  mark = @m.times.map { [] }

  @m.times do |i|
    @n.times do |j|
      next if @grid[i][j] != 1 || mark[i][j]
      area = [[i, j]]
      danger = {}
      wall = 0
      queue = Queue.new
      queue << [i, j]
      mark[i][j] = true
      while !queue.empty?
        s, t = queue.pop
        AROUND.each do |i, j|
          ii, jj = s+i, t+j
          next if ii < 0 || ii >= @m || jj < 0 || jj >= @n
          if @grid[ii][jj] == 1 && mark[ii][jj].nil?
            mark[ii][jj] = true
            queue << [ii, jj]
            area << [ii, jj]
          end
          if @grid[ii][jj] == 0
            wall += 1
            danger[[ii, jj]] = true
          end
        end
      end
      areas << area
      dangers << danger
      walls << wall
    end
  end

  [areas, dangers, walls]
end

def spread(dangers)
  dangers.each do |danger|
    danger.keys.each do |i, j|
      @grid[i][j] = 1
    end
  end
end

# @param {Integer[][]}@
# @return {Integer}
def contain_virus(grid)
  @grid, @m, @n = grid, grid.size, grid[0].size

  wall_count = 0
  areas, dangers, walls = get_virus_areas()
  while !areas.empty?
    n_area = areas.size
    return wall_count if areas.map(&:size).sum == @m * @n

    pos = 0
    n_area.times do |i|
      pos = i if dangers[i].size > dangers[pos].size
    end

    wall_count += walls[pos]
    areas[pos].each { |i, j| @grid[i][j] = -1 }
    spread(dangers[0,pos] + dangers[pos+1..-1])
  
    areas, dangers, walls = get_virus_areas()
  end
 
  wall_count
end
