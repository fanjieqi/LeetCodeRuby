# @param {Integer[]} nums
# @return {Integer}
def wiggle_max_length(nums)
  return 0 if nums.length == 0
  ups = []
  downs = []
  (0..nums.length-1).each do |i|
    ups[i] = 1
    downs[i] = 1
    (0..i-1).each do |j|
      if nums[j] < nums[i]
        ups[i] = [ups[i], downs[j]+1].max
      elsif nums[j] > nums[i]
        downs[i] = [downs[i], ups[j]+1].max
      end
    end
  end
  [ups.max, downs.max].max
end
