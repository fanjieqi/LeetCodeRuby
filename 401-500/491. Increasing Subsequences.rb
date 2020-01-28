# @param {Integer[]} nums
# @return {Integer[][]}
def find_subsequences(nums)
  queue = Queue.new
  nums.each_with_index {|num, i| queue << [[num], i]}
  ans = []
  while !queue.empty?
    arr, i = queue.pop
    ans << arr
    (i+1..nums.length-1).each_with_index do |j|
      next if nums[j] < arr.last
      queue << [arr+[nums[j]], j]
    end
  end
  ans.select{|arr| arr.length > 1}.uniq
end
