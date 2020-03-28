# @param {Integer} n
# @return {Integer}
def monotone_increasing_digits(n)
  res = 0
  s = n.to_s
  l = s.size
  (0..s.size-1).each do |i|
    if i == 0 || s[i] >= s[i-1]
      res += s[i].to_i * 10**(l-1)
    else
      return monotone_increasing_digits(res-1)
    end
    l -= 1
  end
  res
end
