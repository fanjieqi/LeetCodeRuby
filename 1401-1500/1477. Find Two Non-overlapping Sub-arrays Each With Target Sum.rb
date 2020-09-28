# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def min_sum_of_lengths(arr, target)
  n, sum, indexes = arr.size, [], {}
  sum[0] = 0
  (0..n-1).each do |i|
    sum[i+1] = sum[i] + arr[i]
    indexes[sum[i+1]] = i
  end

  prefix, suffix = [], []
  (0..n-1).map do |i|
    j = indexes[sum[i] + target]
    prefix[j] = j-i+1 if j
    suffix[i] = j-i+1 if j
  end

  (1..n-1).each do |i|
    prefix[i] = prefix[i].nil? || (prefix[i-1] &&  prefix[i-1] < prefix[i]) ? prefix[i-1] : prefix[i]
  end
  (n-2).downto(0) do |i|
    suffix[i] = suffix[i].nil? || (suffix[i+1] && suffix[i+1] < suffix[i]) ? suffix[i+1] : suffix[i]
  end

  (0..n-2).map { |i| prefix[i] && suffix[i+1] ? prefix[i] + suffix[i+1] : nil }.compact.min || -1
end
