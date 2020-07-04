# @param {String} s
# @return {Boolean}
def is_valid(s)
  return false if s.size % 3 != 0
  (s.size/3).times do
    s.gsub!('abc', '')
  end
  s == ''
end
