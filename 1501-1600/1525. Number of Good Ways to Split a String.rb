# @param {String} s
# @return {Integer}
def num_splits(s)
  sum, n = [{}], s.size
  (0..n-1).each { |i| sum[i+1] = sum[i].clone.merge(s[i] => sum[i][s[i]].to_i + 1 ) }
  count = 0
  (0..n-2).each do |i|
    tmp = 0
    sum[-1].each do |char, count|
      tmp += 1 if count > sum[i+1][char].to_i
    end
    count += 1 if sum[i+1].size == tmp
  end
  count
end
