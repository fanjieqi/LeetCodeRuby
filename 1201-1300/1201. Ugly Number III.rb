def count_ugly(n, a, b, c, ab, bc, ca, abc)
  answer = n / a + n / b + n / c
  answer -= n / ab + n / bc + n / ca
  answer += n / abc
end

# @param {Integer} n
# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def nth_ugly_number(n, a, b, c)
  ab, bc, ca = a.lcm(b), b.lcm(c), c.lcm(a)
  abc = ab.lcm(c)
  l = 1
  r = 2 * 10 ** 9
  while l < r
    mid = (l + r) / 2
    if count_ugly(mid, a, b, c, ab, bc, ca, abc) < n
      l = mid + 1
    else
      r = mid
    end
  end
  return l
end
