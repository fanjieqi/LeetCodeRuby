# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  (0..nums.length).inject([]) do |result, k|
    result += nums.combination(k).to_a
  end
end
