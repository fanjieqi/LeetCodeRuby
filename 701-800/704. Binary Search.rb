# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  i = nums.bsearch_index { |ele| ele >= target }
  i && nums[i] == target ? i : -1
end
