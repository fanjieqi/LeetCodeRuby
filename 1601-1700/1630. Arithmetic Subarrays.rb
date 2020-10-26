# @param {Integer[]} nums
# @param {Integer[]} l
# @param {Integer[]} r
# @return {Boolean[]}
def check_arithmetic_subarrays(nums, l, r)
  (0..l.size-1).map do |i|
    arr = nums[l[i]..r[i]].sort
    t = arr[1] - arr[0]
    (0..arr.size-2).all? { |j| arr[j+1] - arr[j] == t }
  end
end
