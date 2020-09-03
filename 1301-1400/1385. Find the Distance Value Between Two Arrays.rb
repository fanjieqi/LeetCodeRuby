# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer} d
# @return {Integer}
def find_the_distance_value(arr1, arr2, d)
  arr1.sort!
  arr2.sort!
  count = 0
  arr1.each do |n1|
    i = arr2.bsearch_index { |n2| n2 >= n1 } || arr2.size
    if arr2[i] && (arr2[i] - n1).abs <= d || \
      i > 0 && arr2[i-1] && (arr2[i-1] - n1).abs <= d || \
      i < arr2.size-1 && arr2[i+1] && (arr2[i+1] - n1).abs <= d
      count += 1
    end
  end
  arr1.size - count
end
