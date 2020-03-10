# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_closest_elements(arr, k, x)
  arr.group_by{ |val| (val-x).abs }.sort_by(&:first).map(&:last).flatten[0, k].sort
end
