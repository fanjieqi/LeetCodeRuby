# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  num1 = nums.max
  nums.delete_at(nums.index(num1))
  num2 = nums.max
  (num1-1)*(num2-1)
end
