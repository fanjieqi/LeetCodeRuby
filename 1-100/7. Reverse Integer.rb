# @param {Integer} x
# @return {Integer}
def reverse(x)
  str = if x > 0
    x.to_s.reverse
  elsif x < 0
    "-" + x.to_s[1..-1].reverse
  else
    "0"
  end
  num = str.to_i
  (num > 2147483648 || num < -2147483647) ? 0 : num
end
