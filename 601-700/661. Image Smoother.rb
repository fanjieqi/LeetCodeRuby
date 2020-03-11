AROUND = [
  [0,  -1],
  [0,  +1],
  [-1, -1],
  [-1, +1],
  [1,  -1],
  [1,  +1],
  [-1,  0],
  [+1,  0],
]

# @param {Integer[][]} m
# @return {Integer[][]}
def image_smoother(m)
  map = m.map(&:clone)
  map.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      result = [ele] + AROUND.map { |i, j| x+i<0 || x+i>=map.size || y+j<0 || y+j>=row.size ? nil : map[x+i][y+j] }.compact
      m[x][y] = (result.sum / result.size.to_f).floor.to_i
    end
  end
  m
end
