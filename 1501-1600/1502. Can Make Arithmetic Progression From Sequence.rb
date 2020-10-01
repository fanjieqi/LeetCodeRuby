# @param {Integer[]} arr
# @return {Boolean}
def can_make_arithmetic_progression(arr)
  arr.sort!
  (0..arr.size-3).all? { |i| arr[i+1] - arr[i] == arr[i+2] - arr[i+1] }
end
