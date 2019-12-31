# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  nums.group_by(&:itself).transform_values(&:count).find {|k, v| v > nums.length / 2}[0]
end
