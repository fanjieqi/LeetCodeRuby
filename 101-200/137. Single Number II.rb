# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.group_by(&:itself).transform_values(&:count).find{|k, v| v==1}[0]
end
