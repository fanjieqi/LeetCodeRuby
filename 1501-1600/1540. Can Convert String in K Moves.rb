# @param {String} s
# @param {String} t
# @param {Integer} k
# @return {Boolean}
def can_convert_string(s, t, k)
  return false if s.size != t.size
  hash = {}
  (0..s.size-1).each do |i|
    next if s[i] == t[i]
    tmp = (t[i].ord - s[i].ord) % 26
    hash[tmp] = hash[tmp].to_i + 1
  end
  hash.all? { |key, count| k >= (count-1) * 26 + key }
end
