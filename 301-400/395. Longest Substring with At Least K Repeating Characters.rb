# @param {String} s
# @param {Integer} k
# @return {Integer}
def longest_substring(s, k)
  s.split("").uniq.each do |c|
    next if s.scan(c).count >= k
    return s.split(c).map { |t| longest_substring(t, k).to_i }.max || 0
  end
  s.length.to_i
end
