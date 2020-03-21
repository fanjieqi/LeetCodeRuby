# @param {Integer[]} nums
# @return {Integer}
def find_shortest_sub_array(nums)
  result = nums.group_by(&:itself).transform_values(&:count)
  max = result.values.max
  result.select { |num, degree| degree == max }.map { |num, degree| nums.rindex(num) - nums.index(num) + 1 }.min
end
