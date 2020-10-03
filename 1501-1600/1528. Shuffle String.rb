# @param {String} s
# @param {Integer[]} indices
# @return {String}
def restore_string(s, indices)
  arr = []
  (0..indices.size-1).each { |i| arr[indices[i]] = s[i] }
  arr.join
end
