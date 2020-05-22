# @param {Integer} r
# @param {Integer} c
# @param {Integer} r0
# @param {Integer} c0
# @return {Integer[][]}
def spiral_matrix_iii(r, c, r0, c0)
  array = []
  i, j, n = 0, 1, 0
  while array.size < r * c
    (n/2+1).times do
      array << [r0, c0] if 0 <= r0 && r0 < r && 0 <= c0 && c0 < c
      r0, c0 = r0 + i, c0 + j
    end
    i, j, n = j, -i, n + 1
  end
  array
end
