# @param {Integer} tomato_slices
# @param {Integer} cheese_slices
# @return {Integer[]}
def num_of_burgers(tomato_slices, cheese_slices)
  x = tomato_slices - cheese_slices * 2
  return [] if x.odd? || x.negative?
  x /= 2
  y = cheese_slices - x
  return [] if y.negative?
  [x, y]
end
