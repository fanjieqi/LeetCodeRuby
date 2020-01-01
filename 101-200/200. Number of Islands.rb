AROUND = [
  [1, 0],
  [0, 1],
  [0, -1],
  [-1, 0],
]

def dfs(map, x, y, color)
  return if x < 0 || x > map.length-1 || y < 0 || y > map[0].length - 1
  map[x][y] = color if map[x][y] == 1
  AROUND.each do |i, j|
    next if x+i < 0 || x+i > map.length-1 || y+j < 0 || y+j > map[0].length - 1
    dfs(map, x+i, y+j, color) if map[x+i][y+j] == 1
  end
end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  map = grid.map {|row| row.map(&:to_i) }
  color = 1
  map.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      dfs(map, x, y, color+=1) if ele == 1
    end
  end
  color - 1
end
