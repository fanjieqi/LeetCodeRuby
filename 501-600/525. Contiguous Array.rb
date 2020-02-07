# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
  f = []
  hash = {}
  nums.each_with_index do |num,i|
    nums[i] = -1 if nums[i] == 0
    f[i] = i > 0 ? f[i-1] + nums[i] : nums[i]
    hash[f[i]] ||= []
    hash[f[i]] << i
  end

  max = 0
  f.each_with_index do |k, i|
    tmp = hash[k-nums[i]] && hash[k-nums[i]].last || nil
    max = tmp-i+1 if tmp && tmp > i && tmp-i+1 > max
  end
  max
end
