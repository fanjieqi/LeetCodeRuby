MOD = 10**9 + 7
# @param {String} s
# @param {Integer} k
# @return {Integer}
def number_of_arrays(s, k)
  f, l = [0], k.to_s.size
  (0..s.size-1).each do |i|
    f[i+1] ||= 0
    (0..l).each do |j|
      next if i-j < 0
      cur = s[(i-j)..i].to_i
      next if cur == 0 || cur > k || cur.to_s.size != j+1
      f[i+1] += (f[i-j] == 0 ? 1 : f[i-j])
    end
    f[i+1] %= MOD
  end
  f[-1] % MOD
end
