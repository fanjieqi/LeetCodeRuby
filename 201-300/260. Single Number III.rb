# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
  nums.group_by(&:itself).select {|k, v| v.count == 1}.map(&:first)
end
