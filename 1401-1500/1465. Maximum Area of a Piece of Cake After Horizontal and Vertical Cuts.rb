MOD = 10**9 + 7
# @param {Integer} h
# @param {Integer} w
# @param {Integer[]} horizontal_cuts
# @param {Integer[]} vertical_cuts
# @return {Integer}
def max_area(h, w, horizontal_cuts, vertical_cuts)
  horizontal_cuts.prepend(0).append(h).sort!
  vertical_cuts.prepend(0).append(w).sort!
  n = (0..horizontal_cuts.size-2).map { |i| horizontal_cuts[i+1] - horizontal_cuts[i] }.max
  m = (0..vertical_cuts.size-2).map { |j| vertical_cuts[j+1] - vertical_cuts[j] }.max
  n * m % MOD
end
