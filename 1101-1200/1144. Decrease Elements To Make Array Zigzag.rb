# @param {Integer[]} nums
# @return {Integer}
def moves_to_make_zigzag(nums)
  sum1, sum2 = 0, 0
  (0..nums.size-1).each do |i|
    if i.odd?
      sum1 += [i > 0 && nums[i] >= nums[i-1] ? (nums[i]-nums[i-1]+1) : 0, i < nums.size-1 && nums[i] >= nums[i+1] ? (nums[i]-nums[i+1]+1) : 0].max
    elsif i.even?
      sum2 += [i > 0 && nums[i] >= nums[i-1] ? (nums[i]-nums[i-1]+1) : 0, i < nums.size-1 && nums[i] >= nums[i+1] ? (nums[i]-nums[i+1]+1) : 0].max
    end
  end
  [sum1, sum2].min
end
