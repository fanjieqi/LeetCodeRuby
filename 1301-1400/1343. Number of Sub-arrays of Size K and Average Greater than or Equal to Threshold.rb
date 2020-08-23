# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} threshold
# @return {Integer}
def num_of_subarrays(arr, k, threshold)
  n, sum = arr.size, [0]
  (0..n-1).each { |i| sum[i+1] = sum[i] + arr[i] }
  threshold *= k
  (0..n-k).inject(0) { |tmp, i| tmp += (sum[i+k]-sum[i]) >= threshold ? 1 : 0 }
end
