# @param {String} s
# @return {Integer}
def count_binary_substrings(s)
  l1 = s.scan(/1+/).map(&:size)
  l0 = s.scan(/0+/).map(&:size)
  array = s[/^1/] ? l1.zip(l0).flatten : l0.zip(l1).flatten
  (0..array.size-2).inject(0) { |sum, i| sum += [array[i], array[i+1].to_i].min }
end
