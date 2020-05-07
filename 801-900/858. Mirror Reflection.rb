# @param {Integer} p
# @param {Integer} q
# @return {Integer}
def mirror_reflection(p, q)
  k = 1
  k += 1 while (q * k % p) > 0
  return 1 if q * k / p % 2 > 0 && k % 2 > 0
  return 0 if q * k / p % 2 == 0 && k % 2 > 0
  return 2 if q * k / p % 2 > 0 && k % 2 == 0
  -1
end
