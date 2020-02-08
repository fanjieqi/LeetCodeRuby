# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
  s.split("").each_slice(k).map.with_index{|s, i| i.even? ? s.reverse : s}.join
end
