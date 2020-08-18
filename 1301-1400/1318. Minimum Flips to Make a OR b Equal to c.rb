# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def min_flips(a, b, c)
  a, b, c = a.to_s(2).reverse, b.to_s(2).reverse, c.to_s(2).reverse
  n = [a.size, b.size, c.size].max
  count = 0
  (0..n-1).each do |i|
    next if a[i].to_i | b[i].to_i  == c[i].to_i
    count += (a[i].to_i - 0) + (b[i].to_i - 0) if c[i].to_i == 0
    count += 1 if c[i].to_i == 1
  end
  count
end
