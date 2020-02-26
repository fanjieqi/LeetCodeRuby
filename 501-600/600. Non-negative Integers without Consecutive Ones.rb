# @param {Integer} num
# @return {Integer}
def find_integers(num)
  x, y = 1, 2
  res = 0
  num += 1
  while num > 0
    res = 0 if num & 1 > 0 and num & 2 > 0
    res += x * (num & 1)
    num = num >> 1
    x, y = y, x + y
  end
  res
end
