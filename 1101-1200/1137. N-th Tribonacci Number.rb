# @param {Integer} n
# @return {Integer}
def tribonacci(n)
  a = [0, 1, 1]
  return a[n] if n <= 2
  (n-2).times do
    tmp = a[0] + a[1] + a[2]
    a = [a[1], a[2], tmp]
  end
  a[-1]
end
