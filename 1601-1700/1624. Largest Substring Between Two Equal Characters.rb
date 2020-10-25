# @param {String} s
# @return {Integer}
def max_length_between_equal_characters(s)
  indexes = (0..s.size-1).group_by{ |i| s[i] }
  return -1 if indexes.values.map(&:size).uniq == [1]
  indexes.transform_values!(&:sort)
  max = nil
  indexes.each do |char, pos|
    tmp = pos[-1]-pos[0] - 1
    max = tmp if max.nil? || tmp > max
  end
  max
end
