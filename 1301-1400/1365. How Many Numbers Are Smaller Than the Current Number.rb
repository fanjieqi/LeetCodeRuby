# @param {Integer[]} nums
# @return {Integer[]}
def smaller_numbers_than_current(nums)
  array = nums.sort
  nums.map { |num| array.bsearch_index { |ele| ele >= num } || array.size-1 }
end
