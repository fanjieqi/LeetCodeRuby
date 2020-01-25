# @param {Integer[]} nums
# @return {Boolean}
def circular_array_loop(nums)
  check = []
  nums.each_with_index do |num, i|
    next if check[i]
    mark = {}
    count = 1
    j = i
    k = nil
    while !mark[j]
      k = (j + nums[j]) % nums.length
      mark[j] = k
      j = k
    end
    arr = mark.keys.map{|k| nums[k]}
    return true if mark.all?{|k, v| mark[v] && k != v } && (arr.all?(&:positive?) || arr.all?(&:negative?))
  end
  false
end
