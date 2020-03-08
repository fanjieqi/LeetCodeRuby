# @param {String} s
# @return {Integer}
def count_substrings(s)
  count = 0
  (1..s.size).each do |k|
    (0..s.size-k).each do |i|
      count += 1 if s[i] == s[i+k-1] && s[i,k] == s[i,k].reverse
    end
  end
  count
end
