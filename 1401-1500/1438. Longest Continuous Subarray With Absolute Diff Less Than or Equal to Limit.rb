# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
def longest_subarray(nums, limit)
  maxq, minq = [], []
  ans, i = 0, 0
  nums.each_with_index do |num, j|
    k = maxq.bsearch_index { |ele, _| ele > -num } || maxq.size
    maxq.insert(k, [-num, j])

    k = minq.bsearch_index { |ele, _| ele > num } || minq.size
    minq.insert(k, [num, j])

    while -maxq[0][0] - minq[0][0] > limit
      i = [maxq[0][1], minq[0][1]].min + 1
      maxq.shift while maxq[0][1] < i
      minq.shift while minq[0][1] < i
    end
    k = j - i + 1
    ans = k if k > ans
  end
  ans
end
