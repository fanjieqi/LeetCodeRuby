# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sum_of_three_subarrays(nums, k)
  w1, w2, w3 = nums[0,k].sum, nums[k,k].sum, nums[2*k,k].sum
  mw1, mw2, mw3 = w1, w1+w2, w1+w2+w3
  i1, i2, i3 = [0], [0,k], [0,k,2*k]
  (0..nums.size-3*k).each do |i|
    w1 += nums[i+k] - nums[i]
    w2 += nums[i+2*k] - nums[i+k]
    w3 += nums[i+3*k].to_i - nums[i+2*k]
    mw1, i1 = [w1, [i+1]] if w1 > mw1
    mw2, i2 = [mw1 + w2, i1 + [i+1+k]] if mw1 + w2 > mw2
    mw3, i3 = [mw2 + w3, i2 + [i+1+2*k]] if mw2 + w3 > mw3
  end
  i3
end
