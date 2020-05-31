# @param {Integer[]} a
# @return {Integer}
def partition_disjoint(a)
  max_l, min_r = [], []
  (0..a.size-1).each do |i|
    max_l[i] = (i.zero? || a[i] > max_l[i-1]) ? a[i] : max_l[i-1]
  end
  (a.size-1).downto(0) do |i|
    min_r[i] = (i == a.size-1 || a[i] < min_r[i+1]) ? a[i] : min_r[i+1]
  end
  (0..a.size-2).find { |i| max_l[i] <= min_r[i+1] } + 1
end
