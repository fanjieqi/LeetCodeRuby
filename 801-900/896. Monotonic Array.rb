# @param {Integer[]} a
# @return {Boolean}
def is_monotonic(a)
  (0..a.size-2).all? { |i| a[i] <= a[i+1] } || (0..a.size-2).all? { |i| a[i] >= a[i+1] }
end
