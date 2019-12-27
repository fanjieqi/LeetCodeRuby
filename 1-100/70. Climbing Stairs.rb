# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  f = [1, 2]
  (2..n-1).each do |i|
    f[i] = f[i-1] + f[i-2]
  end
  f[n-1]
end
