# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  f = []
  nums.each_with_index do |num, i|
    if f[i-1] && (num > nums[i-1])
      f[i] = f[i-1]+1
    else
      f[i] = 1
    end
  end
  f.max.to_i
end
