# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def smallest_range_ii(a, k)
  a.sort!
  ans = a[-1] - a[0]
  (0..a.size-2).each do |i|
    max = [a[-1], a[i]+2*k].max
    min = [a[i+1], a[0]+2*k].min
    ans = [ans, max - min].min
  end
  ans
end
