# @param {Integer} n
# @return {Integer}
def bulb_switch(n)
  return n if n <= 1
  return 1 if n <= 3
  rest = 1
  tmp = 3
  while n > tmp
    n -= tmp
    tmp += 2
    rest += 1
  end
  rest
end
