# @param {Integer[]} a
# @return {Integer[]}
def pancake_sort(a)
  n = a.size
  ans = []
  while n > 0
    i = a.index(n)
    if i != n - 1
      if i != 0
        a = a[0..i].reverse + a[i+1..-1]
        ans << i + 1
      end
      a = a[0..n-1].reverse
      ans << n
    end
    n -= 1
  end
  ans
end
