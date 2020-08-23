# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[]}
def k_weakest_rows(mat, k)
  arr = mat.map(&:sum)
  (0..arr.size-1).sort_by { |i| [arr[i], i] }[0, k]
end
