# @param {Integer} x
# @param {Integer} y
# @param {Integer} bound
# @return {Integer[]}
def powerful_integers(x, y, bound)
  hash = {}
  (0..(x == 1 ? 0 : Math.log(bound, x))).each do |i|
    a = x**i
    next if bound <= a
    (0..(y == 1 ? 0 : Math.log(bound-a, y))).each do |j|
      tmp = a + y**j
      hash[tmp] = true
    end
  end

  hash.keys
end
