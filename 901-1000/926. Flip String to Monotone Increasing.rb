# @param {String} s
# @return {Integer}
def min_flips_mono_incr(s)
  count0, count1 = [], []
  s.each_char.with_index do |c, i|
    if c == '0'
      count0[i] = count0[i-1].to_i + 1
      count1[i] = count1[i-1].to_i
    else
      count0[i] = count0[i-1].to_i
      count1[i] = count1[i-1].to_i + 1
    end
  end
  n = s.length
  min = n
  (0..n).each do |i|
    if i == 0
      tmp = count0[n-1]
    elsif i == n
      tmp = count1[n-1]
    else
      tmp = count1[i-1] + (count0[n-1] - count0[i])
    end
    min = tmp if tmp < min
  end
  min
end
