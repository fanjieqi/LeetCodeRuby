# @param {Integer[]} a
# @return {Integer}
def best_rotation(a)
  nums = a.map.with_index { |num, i| i - num }.sort
  max = 0
  max_i = 0
  a.each_with_index do |num, i|
    nums.shift while nums.size > 0 && nums[0] < i
    if nums.count > max
      max_i = i
      max = nums.count
    end
    tmp = a.size - num + i
    j = nums.bsearch_index { |ele| ele >= tmp } || -1
    nums.insert(j, tmp)
  end
  max_i
end
