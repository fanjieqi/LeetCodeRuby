# @param {Integer[]} nums
# @return {Integer}
def max_sum_div_three(nums)
  n = nums.sort!.size
  sum = nums.sum
  tmp = sum % 3
  if tmp == 0
    sum
  elsif tmp == 1
    i1 = (0..n-1).find { |i| nums[i] % 3 == 1 }
    i1 ? sum - nums[i1] : 0

    i2 = (0..n-2).find { |i| nums[i] % 3 == 2 }
    j2 = i2 ? (i2+1..n-1).find { |i| nums[i] % 3 == 2 } : nil

    if i1 && i2 && j2
      [sum-nums[i1], sum-nums[i2]-nums[j2]].max
    elsif i2 && j2
      sum-nums[i2]-nums[j2]
    elsif i1
      sum-nums[i1]
    else
      0
    end
  elsif tmp == 2
    i1 = (0..n-2).find { |i| nums[i] % 3 == 1 }
    j1 = i1 ? (i1+1..n-1).find { |i| nums[i] % 3 == 1 } : nil

    i2 = (0..n-1).find { |i| nums[i] % 3 == 2 }

    if i1 && j1 && i2
      [sum-nums[i1]-nums[j1], sum-nums[i2]].max
    elsif i1 && j1
      sum-nums[i1]-nums[j1]
    elsif i2
      sum-nums[i2]
    else
      0
    end
  end
end
