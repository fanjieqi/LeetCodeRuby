# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  index = nums.index(target)
  tmp = nums.select{|ele| ele > target}.first
  index || (tmp ? nums.index(tmp) : nil) || nums.length
end
