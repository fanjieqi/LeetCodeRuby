# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  return (numerator / denominator).to_s if numerator % denominator == 0
  o, q, r, s, m = numerator.abs, denominator.abs, numerator.abs % denominator.abs, '', {}
  while r.positive? && m[r].nil?
    m[r] = s.length
    s += (r * 10 / q).to_s
    r = r * 10 % q
  end
  ((numerator > 0) == (denominator > 0) ? '' : '-') + 
  (o / q).to_s + '.' + 
  (r.positive? ? s[0,m[r]] + '(' + s[m[r]..-1] + ')' : s)
end
