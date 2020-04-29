# @param {Integer[]} a
# @return {Integer}
def peak_index_in_mountain_array(a)
  (1..a.size-2).find { |i| a[i-1] < a[i] && a[i] > a[i+1] } || -1
end
