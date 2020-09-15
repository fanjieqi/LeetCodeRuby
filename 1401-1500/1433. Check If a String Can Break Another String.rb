# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_if_can_break(s1, s2)
  n, s1, s2 = s1.size, s1.chars.sort.join, s2.chars.sort.join
  (0..n-1).all? { |i| s1[i] >= s2[i] } || (0..n-1).all? { |i| s1[i] <= s2[i] }
end
