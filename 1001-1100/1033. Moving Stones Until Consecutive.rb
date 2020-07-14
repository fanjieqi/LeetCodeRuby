# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer[]}
def num_moves_stones(a, b, c)
  s = [a, b, c].sort
  return [0, 0] if s[2]-s[0] == 2
  [[s[1]-s[0], s[2]-s[1]].min <= 2 ? 1 : 2, s[2]-s[0]-2 ]
end
