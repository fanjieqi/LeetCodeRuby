# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def combination_sum4(nums, target)
  f = [0]
  nums = nums.sort.reject{|num| num > target}
  nums.each {|num| f[num] = 1} 
  (1..target).each do |i|
    nums.each do |num|
      tmp = i - num
      if tmp >= 0 && f[tmp] 
        f[i] ||= 0
        f[i] += f[tmp]
      end
    end
  end
  f[target] || 0
end
