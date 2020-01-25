# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  stack = []
  s3 = - (1 << 31)
  nums.reverse.each do |n|
    return true if n < s3
    s3 = stack.pop() while !stack.empty? && stack.last < n
    stack << n
  end
  false
end
