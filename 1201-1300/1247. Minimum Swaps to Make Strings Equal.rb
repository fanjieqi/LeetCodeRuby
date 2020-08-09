# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_swap(s1, s2)
  n, xy, yx = s1.size, 0, 0
  (0..n-1).each do |i|
    if s1[i] == 'x' && s2[i] == 'y'
      xy += 1
    elsif s1[i] == 'y' && s2[i] == 'x'
      yx += 1
    end
  end
  return -1 if xy.even? && yx.odd? || yx.even? && xy.odd?
  (xy / 2) + (yx / 2) + (xy % 2) + (yx % 2)
end
