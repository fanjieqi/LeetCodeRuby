# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.length == 0 || s[0] == "0" || s[/0{2,}/] || s[/[3-9]0/]
  f = [1]

  (1..s.length-1).each do |i|
    if i == 1
      f[i] = s[i] != "0" && (s[i-1,2].to_i <= 26) ? 2 : 1
    elsif s[i] == "0"
      f[i] = f[i-2]
    elsif s[i-1] != "0" && s[i-1,2].to_i <= 26
      f[i] = f[i-2] + f[i-1]
    elsif 
      f[i] = f[i-1]
    end
  end
  f.last
end
