# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  return tasks.size if n == 0
  nums = tasks.group_by(&:itself).values.map(&:size).sort_by{|num| -num}

  count = 0
  while nums.size > 0
    if nums.size <= n && nums.all?{|num| num == 1}
      (0..nums.size-1).each { |j| nums[j] -= 1 }
      count += nums.size
    else
      (0..[nums.size-1,n].min).each { |j| nums[j] -= 1 }
      count += (n+1)
    end
    nums.delete_if(&:zero?)
    nums = nums.sort_by{|num| -num}
  end
  count
end
