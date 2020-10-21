# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
  nums.sort!
  (0..1000).find { |i| nums.size - nums.bsearch_index { |ele| ele >= i } == i rescue nil } || -1
end
