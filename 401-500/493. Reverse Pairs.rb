# @param {Integer[]} nums
# @return {Integer}
def reverse_pairs(nums)
  arr = []
  ans = 0
  nums.each_with_index do |num, i|
    k = arr.bsearch_index{|x| x > 2*num}
    ans += arr.length - k if k
    i = arr.bsearch_index{|x| x >= num} || -1
    arr.insert(i, num)
  end
  ans
end
