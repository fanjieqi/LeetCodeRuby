# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  return (s1 + s2 == s3) if s1.length == 0 || s2.length == 0
  return false if s1.length + s2.length != s3.length
  f = []
  (0..s1.length+1).each do |i|
    f[i] ||= []
    (0..s2.length+1).each do |j|
      k = i + j
      if i != 0 && j != 0
        f[i][j] = s1[i-1] == s3[k-1] && f[i-1][j] || s2[j-1] == s3[k-1] && f[i][j-1]
      elsif i == 0
        f[i][j] = s2[0..j-1] == s3[0..k-1]
      elsif j == 0
        f[i][j] = s1[0..i-1] == s3[0..k-1]
      else
        f[i][j] = false
      end
    end
  end
  f[s1.length][s2.length]
end
