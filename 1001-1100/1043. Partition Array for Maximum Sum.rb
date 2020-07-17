# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def max_sum_after_partitioning(a, k)
  n, max, f = a.size, [], []

  (0..a.size-1).each do |i|
    max[i] ||= {}
    num = a[i]
    (i..[i+k-1, a.size-1].min).each do |j|
      num = a[j] if a[j] > num
      max[i][j] = num
    end
  end

  (0..a.size-1).each do |i|
    if i < k
      f[i] = max[0][i] * (i+1)
    else
      (i-k..i-1).each do |j|
        tmp = f[j] + max[j+1][i] * (i-j)
        f[i] = tmp if f[i].nil? || tmp > f[i]
      end
    end
  end
  f[-1]
end
