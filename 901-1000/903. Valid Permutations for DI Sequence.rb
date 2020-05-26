# @param {String} s
# @return {Integer}
def num_perms_di_sequence(s)
  f = (0..s.size).map { [1] }
  s.each_char do |c|
    if c == "I"
      f = f[0..-2]
      (1..f.size-1).each { |i| f[i] += f[i - 1] }
    else
      f = f[1..-1]
      (f.size-2).downto(0).each { |i| f[i] += f[i+1] }
    end
  end
  f[0] % (10**9 + 7)
end
