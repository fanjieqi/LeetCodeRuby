# @param {Integer} n
# @return {Integer}
def find_nth_digit(n)
  start = {}
  count = {}
  (1..9).each do |i|
    n1 = 10 ** (i-1)
    n2 = 10 ** i - 1
    start[i] = n1
    count[i] = n2 - n1 + 1
  end
  i = 1
  while n > i * count[i]
    n -= i * count[i]
    i += 1
  end
  offset = (n-1) / i
  tmp = n % i
  (start[i] + offset).to_s[tmp-1]
end
