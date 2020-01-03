# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  h1 = s.split("").group_by(&:itself).transform_values(&:count)
  h2 = t.split("").group_by(&:itself).transform_values(&:count)
  h2.all? { |k, v| v == h1[k] } && h1.all? { |k, v| v == h2[k] }
end
