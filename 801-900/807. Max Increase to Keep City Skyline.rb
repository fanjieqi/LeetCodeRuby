# @param {Integer[][]} grid
# @return {Integer}
def max_increase_keeping_skyline(grid)
  n = grid.size
  maxx, maxy = n.times.map {0}, n.times.map {0}
  grid.each_with_index do |row, i|
    row.each_with_index do |num, j|
      maxx[i] = num if num > maxx[i]
      maxy[j] = num if num > maxy[j]
    end
  end
  count = 0
  grid.each_with_index do |row, i|
    row.each_with_index do |num, j|
      count += [maxx[i], maxy[j]].min - num
    end
  end
  count
end
