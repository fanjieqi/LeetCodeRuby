AROUND = {
  'N' => [0, -1],
  'S' => [0,  1],
  'W' => [-1, 0],
  'E' => [1,  0],
}

# @param {String} path
# @return {Boolean}
def is_path_crossing(path)
  x, y = 0, 0
  hash = {0 => {0 => true}}
  path.each_char do |dir|
    x += AROUND[dir][0]
    y += AROUND[dir][1]
    hash[x] ||= {}
    return true if hash[x][y]
    hash[x][y] = true
  end
  false
end
