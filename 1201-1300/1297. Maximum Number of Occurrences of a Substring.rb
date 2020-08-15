# @param {String} s
# @param {Integer} max_letters
# @param {Integer} min_size
# @param {Integer} max_size
# @return {Integer}
def max_freq(s, max_letters, min_size, max_size)
  n, l = s.size, min_size
  tmp = {}
  (0..l-1).each { |i| tmp[s[i]] = tmp[s[i]].to_i + 1 }

  hash = {}
  hash[s[0..l-1]] = hash[s[0..l-1]].to_i + 1 if tmp.size <= max_letters

  (0..n-l-1).each do |i|
    tmp[s[i]] -= 1
    tmp[s[i+l]] = tmp[s[i+l]].to_i + 1
    tmp.delete(s[i]) if tmp[s[i]].zero?

    hash[s[i+1..i+l]] = hash[s[i+1..i+l]].to_i + 1 if tmp.size <= max_letters
  end
  hash.max_by { |k, v| v }&.last || 0
end
