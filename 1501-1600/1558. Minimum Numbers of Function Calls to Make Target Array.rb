# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
  max, count = nums.max, 0
  nums.delete_at(nums.index(max))

  num = max
  while num > 0
    if num.odd?
      num -= 1
    else
      num /= 2
    end
    count += 1
  end

  nums.each do |num|
    tmp = num
    while num > 0
      if num.odd?
        num -= 1
        count += 1
      else
        num /= 2
      end
    end
  end
  count
end
