# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def longest_ones(a, k)
  l, r = 0, 0
  while r < a.length
    k -= 1 - a[r]
    r += 1
    if k < 0
      k += 1 - a[l]
      l += 1
    end
  end
  r - l
end
