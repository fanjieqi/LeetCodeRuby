# @param {Integer[]} arr
# @return {Boolean}
def unique_occurrences(arr)
  tmp = arr.inject({}) { |tmp, num| tmp.merge(num => tmp[num].to_i + 1) }
  tmp.size == tmp.values.uniq.size
end
