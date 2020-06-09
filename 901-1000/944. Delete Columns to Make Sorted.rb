# @param {String[]} a
# @return {Integer}
def min_deletion_size(a)
  (0..a[0].size-1).inject(0) { |sum, i| 
    sum += (0..a.size-2).any? { |j| a[j][i] > a[j+1][i] } ? 1 : 0
  }
end
