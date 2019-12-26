# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  nums.uniq!
  nums&.length || 0
end
