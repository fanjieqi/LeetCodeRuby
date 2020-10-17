# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def min_subarray(nums, rest)
  n, sum, hash = nums.size, [0], {0 =>-1}
  target = nums.sum % rest
  return 0 if target == 0
  cur, min = 0, nil
  nums.each_with_index do |num, i|
    cur = (cur + num) % rest
    hash[cur] = i
    tmp = (cur - target) % rest
    min = i - hash[tmp] if hash[tmp] && (min.nil? || i-hash[tmp] < min)
  end
  min < n ? min : -1
end
