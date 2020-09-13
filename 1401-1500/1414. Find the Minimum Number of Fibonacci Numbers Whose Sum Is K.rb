# @param {Integer} k
# @return {Integer}
def find_min_fibonacci_numbers(k)
  f = [1, 1]
  i = 2
  while f[i-1] <= k
    f[i] = f[i-1] + f[i-2]
    i += 1
  end

  count = 0
  while k > 0
    i = f.bsearch_index { |ele| ele >= k }
    k -= (f[i] == k ? f[i] : f[i-1])
    count += 1
  end
  count
end
