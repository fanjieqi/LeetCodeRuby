# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  nums.group_by(&:itself).find{|k,v| v.count > 1}[0]
end
