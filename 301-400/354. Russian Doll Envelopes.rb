# @param {Integer[][]} envelopes
# @return {Integer}
def max_envelopes(envelopes)
  return 0 if envelopes.length == 0
  envelopes = envelopes.sort_by {|ele| ele[0] * ele[1]}
  f = [1]
  (1..envelopes.length-1).each do |i|
    f[i] = 1
    (0..i-1).each do |j|
      f[i] = f[j]+1 if f[j]>=f[i] && envelopes[i][0] > envelopes[j][0] && envelopes[i][1] > envelopes[j][1]
    end
  end
  f.max
end
