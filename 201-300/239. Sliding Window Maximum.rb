# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.length == 0
  return nums if k == 1
  hash = {}
  nums.each_with_index do |num, i|
    hash[num] ||= []
    hash[num] << i
  end

  max = []
  count = 0
  n = nums.length
  nums = nums.sort
  while count < n - k + 1
    num = nums.pop
    hash[num].each do |i|
      ([i-k+1, 0].max..[i, n-k].min).each do |j|
        next if max[j]
        max[j] = num
        count += 1
      end
    end
  end
  max
end
