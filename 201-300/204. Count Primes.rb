require 'prime'
# @param {Integer} n
# @return {Integer}
def count_primes(n)
  Prime.each(n-1).count
end
