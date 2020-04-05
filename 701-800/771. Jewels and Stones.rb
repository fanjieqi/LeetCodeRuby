# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  hash = s.split("").group_by(&:itself).transform_values(&:count)
  j.split("").inject(0) { |sum, key| sum += hash[key].to_i }
end
