# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return false if s.length != t.length
  (0..s.length-2).each do |i|
    return false if s[i+1..-1].index(s[i]) != t[i+1..-1].index(t[i])
  end
  true
end
