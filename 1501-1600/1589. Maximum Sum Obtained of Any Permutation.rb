MOD = 10**9 + 7
# @param {Integer[]} nums
# @param {Integer[][]} requests
# @return {Integer}
def max_sum_range_query(nums, requests)
  n, hash, count = nums.size, {}, []
  requests.sort.each do |l, r|
    hash[l] ||= []
    hash[l] << r
  end
  tmp = []
  (0..n-1).each do |i|
    count[i] = hash[i]&.size.to_i + tmp.size
    hash[i]&.each do |num|
      next if num == i
      j = tmp.bsearch_index { |ele| ele >= num } || tmp.size
      tmp.insert(j, num)
    end
    tmp.shift while tmp[0] == i
  end

  count.sort!
  nums.sort!
  (0..n-1).inject(0) { |sum, i| (sum + count[i].to_i * nums[i]) % MOD }
end
