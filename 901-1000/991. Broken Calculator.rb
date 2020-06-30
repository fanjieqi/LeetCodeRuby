# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def broken_calc(x, y)
  return x-y if x >= y
  hash_y = {y => 0}
  r = y
  while r > x
    if r.even?
      hash_y[r/2] = hash_y[r] + 1
      r /= 2
    else
      hash_y[r+1] = hash_y[r] + 1
      r += 1
    end
  end
  array = hash_y.to_a.sort

  hash_y[x] || (x - array[0][0] + array[0][1])
end
