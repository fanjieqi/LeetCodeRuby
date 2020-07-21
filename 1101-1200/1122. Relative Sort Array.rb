# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
  hash = arr1.group_by(&:itself)
  ans = arr2.map { |num| hash.delete(num) }.flatten.compact
  ans + hash.values.flatten.sort
end
