# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
  return 0 if k == 0
  count, product, i = 0, 1, 0
  nums.each_with_index do |num, j|
    product *= num
    while (i <= j && product >= k)
      product /= nums[i]
      i += 1
    end
    count += j - i + 1
  end
  count
end
