# @param {String[]} a
# @return {Integer}
def min_deletion_size(a)
  sum, n, m = 0, a.size, a[0].size
  unsorted = (0..n-2).map { |i| [i, true] }.to_h
  (0..m-1).each do |j|
    if unsorted.keys.any? { |i| a[i][j] > a[i+1][j] }
      sum += 1
    else
      unsorted.keys.each { |i| a[i][j] < a[i+1][j] && unsorted.delete(i) }
    end
  end
  sum
end
