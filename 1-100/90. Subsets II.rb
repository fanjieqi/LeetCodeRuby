# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  nums.sort!
  (0..nums.length).inject([]) do |ans, len|
    ans += nums.combination(len).uniq
  end
end
