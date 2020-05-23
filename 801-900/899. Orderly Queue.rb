# @param {String} s
# @param {Integer} k
# @return {String}
def orderly_queue(s, k)
  s = s.split("")
  k > 1 ? s.sort.join : (0..s.size-1).map { |i| (i == s.size ? "" : s[i..-1].join) + (i.zero? ? "" : s[0, i].join) }.min
end
