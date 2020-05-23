# @param {Integer} k
# @param {Integer} n
# @return {Integer}
def super_egg_drop(k, n)
  step, f = 0, (k+1).times.map { 0 }
  while f[k] < n
    step += 1
    k.downto(1) {|i| f[i] += 1 + f[i-1] }
  end
  step
end
