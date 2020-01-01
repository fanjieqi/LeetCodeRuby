# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.group_by(&:itself).any? {|k, v| v.count > 1}
end
