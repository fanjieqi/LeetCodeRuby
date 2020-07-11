# @param {Integer} r
# @param {Integer} c
# @param {Integer} r0
# @param {Integer} c0
# @return {Integer[][]}
def all_cells_dist_order(r, c, r0, c0)
  ans = []
  (0..r-1).each { |i| (0..c-1).each { |j| ans << [i, j] } }
  ans.sort_by { |x, y| (x-r0).abs + (y-c0).abs }
end
