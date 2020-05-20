# @param {Integer} n
# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def nth_magical_number(n, aa, bb)
  a, b = aa, bb
  a, b = b, a % b while b > 0
  l, r, lcm = 2, 10**14, aa * bb / a
  while l < r
    m = (l + r) / 2
    if m / aa + m / bb - m / lcm < n
      l = m + 1
    else
      r = m
    end
  end
  l % (10**9 + 7)
end
