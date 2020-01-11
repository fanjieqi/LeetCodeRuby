MAX = 1 << 31
# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  min1 = MAX
  min2 = MAX
  nums.each do |num|
    if num < min1
      min1 = num
    elsif num > min1 && num < min2
      min2 = num
    elsif num > min2
      return true
    end
  end
  false
end
