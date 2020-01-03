# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  hash = nums.map {|num| [num, true]}.to_h
  (0..nums.max+1).find {|i| hash[i].nil? }
end
