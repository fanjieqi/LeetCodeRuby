# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  s1, s2 = [], []
  s.each_char { |c| c == "#" ? s1.pop : s1 << c }
  t.each_char { |c| c == "#" ? s2.pop : s2 << c }
  s1 == s2
end
