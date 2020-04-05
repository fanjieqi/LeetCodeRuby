require 'prime'

# @param {Integer} l
# @param {Integer} r
# @return {Integer}
def count_prime_set_bits(l, r)
  hash = {}
  (l..r).inject(0) { |sum, i|
    count = i.to_s(2).scan("1").count
    hash[count] ||= Prime.prime?(count) ? 1 :0
    sum += hash[count]
  }
end
