# @param {Integer[]} a
# @return {Integer}
def largest_perimeter(a)
  a.sort!
  n = a.size
  i, j, k = n-3, n-2, n-1
  while i >= 0
    if a[i] + a[j] > a[k]
      return a[i] + a[j] + a[k]
    else
      i -= 1
      j -= 1
      k -= 1
    end
  end
  0
end
