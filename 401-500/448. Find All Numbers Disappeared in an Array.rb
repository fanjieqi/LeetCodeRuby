# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  arr = []
  (1..nums.length).map{|i| arr[i] = i}
  nums.each {|i| arr[i] = nil }
  arr.reject(&:nil?)
end
