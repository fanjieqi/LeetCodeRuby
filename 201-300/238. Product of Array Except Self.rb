# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  zero_count =  nums.select(&:zero?).count
  if zero_count > 1
    nums.map {0}
  elsif zero_count == 1
    product = nums.select{|num| !num.zero?}.inject(&:*)
    nums.map { |num| num.zero? ? product : 0}
  else
    product = nums.inject(&:*)
    nums.map { |num| product / num }
  end
end
