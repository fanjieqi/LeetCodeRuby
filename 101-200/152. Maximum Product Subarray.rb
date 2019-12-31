def trick(nums)
  return false if nums.any?(&:zero?)
  nums.inject(0) {|sum, num| sum += num < 0 ? 1 :0}.even?
end

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  max = nums[0]

  return nums.inject(1) {|result, num| result *= num } if trick(nums)

  product = [nums[0]]
  (0..nums.length-1).each do |i|
    product[i] = []
    (i..nums.length-1).each do |j|
      if i == j
        product[i][j] = nums[j]
      else
        product[i][j] = product[i][j-1] * nums[j]
      end
      max = product[i][j] if product[i][j] > max
    end
  end

  max
end
