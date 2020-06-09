# @param {Integer[]} a
# @return {Boolean}
def valid_mountain_array(a)
  return false if a.size < 3
  index = (0..a.size-2).find { |i| a[i] > a[i+1] }
  return false if index == 0 || index.nil?
  (index..a.size-2).all? { |i| a[i] > a[i+1] }
end
