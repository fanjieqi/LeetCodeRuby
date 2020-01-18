# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
  f = [nil, 0, 1]
  (3..a.length-1).each do |i|
    f[i] = f[i-1] + i - 1
  end
  nums = (0..a.length-2).map { |i| a[i+1]-a[i] }

  sum = 0
  count = 1
  tmp = nums[0]
  (1..nums.length-1).each do |i|
    if nums[i] == tmp
      count += 1
    else
      sum += f[count]
      count = 1
      tmp = nums[i]
    end
  end
  sum + f[count]
end
