# @param {Integer[]} a
# @param {Integer} l
# @param {Integer} m
# @return {Integer}
def max_sum_two_no_overlap(a, l, m)
  @sum, @l, @m = [0], l, m
  (0..a.size-1).each { |i| @sum[i+1] = @sum[i] + a[i] }
  @maxll, @maxlm, @maxrl, @maxrm = [], [], [], []
  (0..a.size-l).each { |i| @maxll[i] = [@maxll[i-1].to_i, @sum[i+l] - @sum[i]].max }
  (0..a.size-m).each { |i| @maxlm[i] = [@maxlm[i-1].to_i, @sum[i+m] - @sum[i]].max }
  (a.size-l).downto(0) { |i| @maxrl[i] = [@maxrl[i+1].to_i, @sum[i+l] - @sum[i]].max }
  (a.size-m).downto(0) { |i| @maxrm[i] = [@maxrm[i+1].to_i, @sum[i+m] - @sum[i]].max }
  maxlm = (0..a.size-l).inject(0) { |max, i| max = [@maxll[i] + @maxrm[i+l].to_i, max].max }
  maxml = (0..a.size-m).inject(0) { |max, i| max = [@maxlm[i] + @maxrl[i+m].to_i, max].max }
  [maxlm, maxml].max
end
