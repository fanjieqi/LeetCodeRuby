# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps(s, t)
  hash1 = s.chars.group_by(&:itself).transform_values(&:count)
  hash2 = t.chars.group_by(&:itself).transform_values(&:count)
  hash1.inject(0) do |sum, (char, count)|
    sum += (hash2[char].to_i < count) ? count - hash2[char].to_i : 0
  end
end
