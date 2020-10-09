# @param {Integer[]} arr
# @return {Integer}
def find_length_of_shortest_subarray(arr)
  n, l, r = arr.size, 0, arr.size - 1
  l += 1 while l < r && arr[l+1] >= arr[l]
  return 0 if l == n - 1
  r -= 1 while r > 0 && arr[r-1] <= arr[r]
  toRemove = [n-l-1, r].min
  (0..l).each do |i|
    if arr[i] <= arr[r]
      toRemove = [toRemove, r-i-1].min
    elsif r < n - 1
      r += 1
    else
      break
    end
  end
  toRemove
end
