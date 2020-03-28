# @param {Integer[]} nums
# @return {Integer}
def delete_and_earn(nums)
  points, prev, curr = nums.group_by(&:itself).transform_values(&:count), 0, 0
  (0..10000).each do |num|
    prev, curr = curr, [prev + num * points[num].to_i, curr].max
  end
  curr
end
