# @param {Integer[]} nums
# @return {Boolean}
def is_possible(nums)
  array = []
  nums.each do |num|
    k = (0..array.size-1).find { |i| array[i]&.last&.to_i + 1 == num }
    if k
      return false if k < (array.size-1) && array[k].last > array[k+1].last && array[k+1].size < 3
      array[k] << num
    else
      array.unshift([num])
    end
  end
  array.all? { |ele| ele.size > 2 }
end
