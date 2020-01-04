# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
  nums = [1]
  i = 0
  index = [0] * primes.length
  while i < n - 1
    min = primes.map.with_index{|prime, j| prime * nums[index[j]]}.min
    nums[i+=1] = min
    (0..primes.length - 1).each do |j|
      index[j] += 1 while (nums[index[j]] * primes[j] <= nums[i])
    end
  end
  nums[n-1]
end
