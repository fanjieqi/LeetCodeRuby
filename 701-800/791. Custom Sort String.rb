# @param {String} s
# @param {String} t
# @return {String}
def custom_sort_string(s, t)
  hash = t.split("").group_by(&:itself).transform_values(&:count)
  s.split("").inject("") { |sum, c| sum += c * hash.delete(c).to_i } + hash.map { |c, count| c * count }.join
end
