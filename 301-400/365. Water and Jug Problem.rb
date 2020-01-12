# @param {Integer} x
# @param {Integer} y
# @param {Integer} z
# @return {Boolean}
def can_measure_water(x, y, z)
  return false if x + y < z
  x == z || y == z || x + y == z || z % x.gcd(y) == 0
end
