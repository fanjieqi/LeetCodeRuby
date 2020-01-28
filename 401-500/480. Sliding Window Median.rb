# @param {Integer[]} nums
# @param {Integer} k
# @return {Float[]}
def median_sliding_window(nums, k)
  i = 0
  arr = []
  (0..nums.length-k).map do |i|
    if i == 0
      arr = nums[i,k].sort
    else
      pos = arr.bsearch_index{|x| x >= nums[i-1]}
      arr.delete_at(pos)

      pos = arr.bsearch_index{|x| x >= nums[i+k-1]} || -1
      arr.insert(pos, nums[i+k-1])
    end
    k.odd? ? arr[k/2] : (arr[k/2-1] +arr[k/2])/2.0
  end
end
