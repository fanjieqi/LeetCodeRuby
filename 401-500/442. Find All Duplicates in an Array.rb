# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
  nums.group_by(&:itself).select{|k,v| v.count == 2}.map(&:first)
end
