# @param {Integer[][]} nums
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(nums, r, c)
  return nums if nums.length * nums[0].length != r * c
  nums.flatten.each_slice(c).to_a
end
