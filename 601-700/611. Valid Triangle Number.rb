# @param {Integer[]} nums
# @return {Integer}
def triangle_number(nums)
  nums.sort!
  count = 0
  (0..nums.size-3).each do |i|
    (i+1..nums.size-2).each do |j|
      k = nums[j+1..nums.size-1].bsearch_index{|ele| ele >= nums[i] + nums[j]}
      count += k.nil? ? (nums.size-1 - j) : k
    end
  end
  count
end
