# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
  (1..n).map {|i| permutation(10, 10 - i) - permutation(9, 10 - i) }.sum + 1
end

def permutation(n, r)
  result = 1
  while n > r
    result *= n
    n -= 1
  end
  result
end
