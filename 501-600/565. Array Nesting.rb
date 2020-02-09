# @param {Integer[]} nums
# @return {Integer}
def array_nesting(nums)
  color = []
  queue = Queue.new
  nums.each_with_index { |num, i| color[i] = i; queue << i }

  while !queue.empty?
    i = queue.pop
    j = nums[i]
    if color[i] < color[j]
      color[j] = color[i]
      queue << j
    end
  end

  color.group_by(&:itself).transform_values(&:count).values.max
end
