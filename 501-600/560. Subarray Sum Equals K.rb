# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  sum = []
  hash = {}
  nums.each_with_index do |num, i|
    sum[i] = sum[i-1].to_i + num
    hash[sum[i]] ||= []
    hash[sum[i]] << i
  end
  ans = 0
  nums.each_with_index do |num, i|
    tmp = sum[i] - num + k
    ans += hash[tmp].select{|j| j >= i}.size if hash[tmp]
  end
  ans
end
