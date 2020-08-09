# @param {String} s
# @return {Integer}
def balanced_string_split(s)
  count, tmp = 0, 0
  s.each_char do |char|
    tmp += (char == 'R' ? 1 : -1)
    count += 1 if tmp == 0
  end
  count
end
