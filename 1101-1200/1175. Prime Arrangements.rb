require 'prime'
MOD = 10**9 + 7

# @param {Integer} n
# @return {Integer}
def num_prime_arrangements(n)
  primes_count = Prime.each(n).count
  composite_count = n - primes_count
  nums1 = (1..primes_count).inject(1) { |num, i| num = num * i % MOD }
  nums2 = (1..composite_count).inject(1) { |num, i| num = num * i % MOD }
  nums1 * nums2 % MOD
end
