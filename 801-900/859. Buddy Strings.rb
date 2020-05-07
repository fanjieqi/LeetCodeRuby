# @param {String} a
# @param {String} b
# @return {Boolean}
def buddy_strings(a, b)
  return false if a.size != b.size
  return a.split("").group_by(&:itself).values.map(&:size).any? { |count| count >1 } if a == b
  indexes = (0..a.size-1).select { |i| a[i] != b[i] }
  return false if indexes.size > 2
  a[indexes[0]] == b[indexes[1]] && a[indexes[1]] == b[indexes[0]]
end
