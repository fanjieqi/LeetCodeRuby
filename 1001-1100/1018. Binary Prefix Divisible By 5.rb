# @param {Integer[]} a
# @return {Boolean[]}
def prefixes_div_by5(a)
  f, tmp = [], 0
  (0..a.size-1).each do |i|
    tmp = (tmp << 1) + a[i]
    if i == 0 && a[i] == 0
      f[i] = true
    else
      f[i] = f[i-1] && a[i].zero? || (tmp % 5 == 0)
    end
  end
  f
end
