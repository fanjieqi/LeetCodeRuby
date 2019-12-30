# @param {String} s
# @return {Integer}
def min_cut(s)
  return 0 if s.length == 1 || s == s.reverse
  return 1 if s.length == 2 && s[0] != s[-1]

  f = [0]
  (1..s.length-1).each do |i|
    f[i] ||= s[0..i] == s[0..i].reverse ? 0 : i
    (0..i-1).each do |j|
      f[i] = [f[2*j-i-1] + 1, f[i]].min if 2*j-i-1 >= 0 && s[j..i] == s[2*j-i..j].reverse
      f[i] = [f[2*j-i-2] + 1, f[i]].min if 2*j-i-2 >= 0 && s[j..i] == s[2*j-i-1..j-1].reverse
      f[i] = [f[j-1] + 1, f[i]].min if j-1 >= 0 && j == i -1 && s[j] == s[i]
      f[i] = [f[i-1] + 1, f[i]].min
    end
  end
  f[s.length - 1]
end


p min_cut("babba")
p min_cut("coder")
p min_cut("fifgbeajcacehiicccfecbfhhgfiiecdcjjffbghdidbhbdbfbfjccgbbdcjheccfbhafehieabbdfeigbiaggchaeghaijfbjhi")
