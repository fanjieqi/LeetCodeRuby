# @param {Integer} n
# @return {Integer}
def arrange_coins(n)
  tmp = 0
  while n > tmp
    tmp += 1
    n -= tmp
  end
  tmp
end
