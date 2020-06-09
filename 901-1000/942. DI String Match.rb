# @param {String} s
# @return {Integer[]}
def di_string_match(s)
  array = (0..s.size).to_a
  (0..s.size-1).each do |i|
    next if s[i] == 'I'
    array.insert(i, array.pop)
  end
  array
end
