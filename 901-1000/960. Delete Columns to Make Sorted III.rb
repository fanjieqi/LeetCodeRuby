# @param {String[]} a
# @return {Integer}
def min_deletion_size(a)
  n = a[0].size
  f = n.times.map { 1 }
  (1..n-1).each do |j|
    (0..j-1).each do |i|
      f[j] = [f[j], f[i] + 1].max if a.all? { |str| str[i] <= str[j] }
    end
  end
  n - f.max
end
