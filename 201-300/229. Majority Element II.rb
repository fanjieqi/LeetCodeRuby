# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  nums.group_by(&:itself).select{|k, v| v.count > (nums.length/3) }.map(&:first)
end
