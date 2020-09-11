# @param {Integer[]} nums
# @param {Integer[]} index
# @return {Integer[]}
def create_target_array(nums, index)
  array = []
  nums.each_with_index { |num, i| array.insert(index[i], num) }
  array
end
