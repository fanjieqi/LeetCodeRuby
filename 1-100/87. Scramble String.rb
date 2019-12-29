# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  return true if s1 == s2
  return false if s1.length != s2.length
  return s1 == s2 if s1.length == 1
  c1 = s1.split("").group_by(&:itself).transform_values(&:count)
  c2 = s2.split("").group_by(&:itself).transform_values(&:count)
  return false if c1.any? {|k, v| c2[k] != v}
  (0..s1.length-2).each do |i|
    if is_scramble(s1[0..i], s2[0..i]) && is_scramble(s1[i+1..-1], s2[i+1..-1]) ||
      is_scramble(s1[0..i], s2[-i-1..-1]) && is_scramble(s1[i+1..-1], s2[0..-i-2])
      return true
    end
  end
  false
end
